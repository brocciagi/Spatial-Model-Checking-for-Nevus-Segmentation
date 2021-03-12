SOFTWARE, TEST DATA AND SPECIFICATION FOR THE PAPER: "Feasibility of Spatial Model Checking for Nevus Segmentation"
===================================================================================================================

This archive contains the specification, the dataset and the results of the analysis described in the paper "Feasibility of Spatial Model Checking for Nevus Segmentation". Specifically:

Directory DATASETS contains the datasets used to perform the analysis:

data_first10 contains the first 10 images of the ISIC Gallery (https://www.isic-archive.com/#!/topWithHeader/onlyHeaderTop/gallery).
data_first50 contains the first 50 images of the ISIC Gallery (https://www.isic-archive.com/#!/topWithHeader/onlyHeaderTop/gallery).
The other two datasets used in the paper (the test dataset and the training dataset from the ISIC 2016 Challenge) are available at https://challenge.isic-archive.com/data

All the data in the datasets within directory DATASETS are among those licensed for free public download and use, under the CC-0 license (https://creativecommons.org/publicdomain/zero/1.0/).

Directory SPECIFICATION contains the specification used to perform the analysis.

The model checker used to perform the analysis is VoxLogicA (version 0.6.0_osx-x64), a tool for analysing images using ImgQL specifications available at https://github.com/vincenzoml/VoxLogicA.

Directory OUTPUT contains the results of the analysis as reported in the paper. Specifically:

nevusSegm_V15_2021_01_12_19H00_nevSegV0_FINAL_first10.csv is the file reporting the similarity scores for the analysis of the images in data_first10
nevusSegm_V15_2021_01_12_19H00_nevSegV0_FINAL_first50.csv is the file reporting the similarity scores for the analysis of the images in data_first50
nevusSegm_V15_2021_01_12_19H00_nevSegV0_FINAL_TestData.csv is the file reporting the similarity scores for the analysis of the images in TestData
nevusSegm_V15_2021_01_12_19H00_nevSegV0_FINAL_TrainingData.csv is the file reporting the similarity scores for the analysis of the images in TrainingData

RUNNING THE ANALYSIS
====================

On linux and osx, the included Makefile can be used to reproduce the analysis on the "first10" dataset. On linux: run "make" (tested on ubuntu 20.10); on osx, run "make osx" (tested on osx 10.13.6).

To run the analysis on windows, WSL is needed (see https://docs.microsoft.com/en-us/windows/wsl/about) to use the provided bash script. As an alternative, you may consider replacing the strings "$INPUTDIR", "$NAME" and "$OUTPUTDIR" manually, and running the voxlogica executable without using the provided bash script.  

On any system, to run the analysis on other datasets:

1) Unzip the voxlogica release

2) Set the environment variable "VOXLOGICA" to point to the correct executable for your operating system ("VoxLogicA" or "VoxLogicA.exe", in the directory corresponding to your operating system). 

3) Execute:

    run_analysis.sh DATASETS/data_first10 SPECIFICATION/nevusSegm_V15_2021_01_12_19H00_nevSegV0_FINAL.imgql

The dataset (first parameter) can be changed. 

The output will be written in the "results" directory (divided by dataset and experiment date). The ".csv" files therein contain information on the various indexes (e.g )
