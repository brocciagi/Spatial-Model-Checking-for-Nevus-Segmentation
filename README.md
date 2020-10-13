# Spatial-Model-Checking-for-Nevus-Segmentation
Application of spatial and spatio-temporal model checking techniques to the contouring of (2D)  images of nevi from a public dataset released by the International Skin Imaging Collaboration (ISIC). 

Directory DATASETS contains two datasets used to perform the analysis:
  - data_first10 contains the first 10 images of the ISIC Gallery (https://www.isic-archive.com/#!/topWithHeader/onlyHeaderTop/gallery).
  - data_first50 contains the first 50 images of the ISIC Gallery (https://www.isic-archive.com/#!/topWithHeader/onlyHeaderTop/gallery).
All the data in the datasets within directory DATASETS are among those licensed for free public download and use, under the CC-0 license (https://creativecommons.org/publicdomain/zero/1.0/).

Directory SPECIFICATION contains the specification used to perform the analysis. The model checker used to perform the analysis is VoxLogicA, a tool for analysing images using ImgQL specifications available at https://github.com/vincenzoml/VoxLogicA.

Directory OUTPUT contains the results of the analysis for both the datasets. Specifically:
  - nevusSegm_v8d_2020_10_08_16h52_nevSegV0_CLEAN_public_first10-stats.csv is the file reporting the similarity scores for the analysis of  the images in data_first10 
  - nevusSegm_v8d_2020_10_08_16h52_nevSegV0_CLEAN_public_first50-stats.csv is the file reporting the similarity scores for the analysis of  the images in data_first50 
  - data_first10 is the directory containing a sub-directory for each image in data_first10. Each sub-directory contains the images resulting from the analysis.
  - data_first50 is the directory containing a sub-directory for each image in data_first50. Each sub-directory contains the images resulting from the analysis.
