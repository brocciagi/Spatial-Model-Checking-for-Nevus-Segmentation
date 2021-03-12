#!/bin/bash

usage() {
    echo
    echo "usage: $0 dataset scriptname outputdir"
    echo "dataset is the dataset name"
    echo "scriptname is the template script name with .imgql extension"
    echo "outputdir is the directory where all results will be saved (optional, default is the main output directory)"
}

process() {
    OUTPUTDIR="$OUTPUTPREFIX/"$(basename "$INPUTDIR")
    EXECUTE="$OUTPUTDIR"/input.imgql
    LOG="$OUTPUTDIR"/log.txt
    mkdir -p "$OUTPUTDIR"
    cat "$SCRIPTNAME" |
	sed 's@$NAME@'"$NAME"'@g' |
	sed 's@$INPUTDIR@'"$INPUTDIR"'@g' |
	sed 's@$OUTPUTDIR@'"$OUTPUTDIR"'@g' > "$EXECUTE"
    echo -n "$SCRIPTNAME started at $(date) on $NAME..."
    echo "$SCRIPTNAME started at $(date) on $NAME" > "$LOG"
    "$VOXLOGICA" "$EXECUTE" >> "$LOG"
    RET=$?
    if [ "$RET" -ne "0" ]; then
	echo " [failed with code $RET (see $LOG for details)]"
    cat $LOG
    else
	echo " [OK]"
	if ! [ -f "$STATS" ]; then
	    echo -ne "filename\t" > "$STATS"
	    cat "$LOG" | grep '\[user\]'| cut -b 23- | sort | cut -f 1 -d "=" | tr "\n" "\t" >> "$STATS"
	    echo >> "$STATS"
	fi
	echo -ne "$NAME\t" >> "$STATS"
	cat "$LOG" | grep '\[user\]' | cut -b 23- | sort | cut -f 2 -d "=" | tr "\n" "\t" | tr -d '"' >> "$STATS"
	echo >> "$STATS"
    fi
}


canonical() {
    echo $1
    #echo "$(dirname "$1")/$(basename "$1")"
}

BASEDIR=$(canonical $(dirname "$BASH_SOURCE"))

resolve() {
    if [[ -e "$1" ]]; then 
        echo $(canonical "$1")
    else 
        RES=$(canonical "$BASEDIR"/"$2"/"$1")
        if [[ -e "$RES" ]]; then
            echo "$RES"
        else
            echo "WARNING: file or directory $1 does not exist either in the current directory or under $BASEDIR" 1>&2
            echo "$RES"
        fi
    fi
}

if [ "$VOXLOGICA" == "" ]; then
    VOXLOGICA="VoxLogicA_0.6.0_linux-x64/VoxLogicA"
fi

echo VoxLogicA executable: $VOXLOGICA

if [ "$#" -lt 2 ]; then
    usage
else
    if [ "$#" -eq 3 ]; then 
        OUTPUT=$(resolve "$3" results)
    else
        OUTPUT=$BASEDIR/results        
    fi
    DATASET=$(resolve "$1" datasets)
    SCRIPTNAME=$(resolve "$2" specifications)
    echo Base directory: $BASEDIR 
    echo Dataset location: $DATASET
    echo Specification location: $SCRIPTNAME     
    OUTPUTPREFIX=$OUTPUT/$(basename "$SCRIPTNAME" ".imgql")/$(basename "$DATASET")/$(date '+%Y-%m-%d-%H-%M-%S')-$(basename $(dirname "$VOXLOGICA"))
    echo Output location: $OUTPUTPREFIX
    STATS="$OUTPUTPREFIX/stats.csv"
    CASES=$(mktemp)
    if [[ -f "$DATASET" ]]; then
        DIR=$(resolve $(basename "$DATASET" | cut -f 1 -d "#") datasets)    
        cat "$DATASET" | xargs -I# echo "$DIR/"# > "$CASES"
    else
        DIR="$DATASET"        
        find -L "$DIR" -mindepth 1 -maxdepth 1 -type d > "$CASES"
    fi    
    cat "$CASES" | while read -d $'\n' INPUTDIR
    do NAME=$(basename "$INPUTDIR")
        process
    done
fi

