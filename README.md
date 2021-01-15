# Spatial-Model-Checking-for-Nevus-Segmentation
Application of spatial and spatio-temporal model checking techniques to the contouring of (2D)  images of nevi from a public dataset released by the International Skin Imaging Collaboration (ISIC). 

------------------------------------------------------------------------------------
Directory "Feasibility_of_Spatial_Model_Checking_for_Nevus_Segmentation" contains all the specification, the dataset and the results of the analysis described in the paper "Feasibility of Spatial Model Checking for Nevus Segmentation". Specifically:

- Directory DATASETS contains the datasets used to perform the analysis:
  - data_first10 contains the first 10 images of the ISIC Gallery (https://www.isic-archive.com/#!/topWithHeader/onlyHeaderTop/gallery).
  - data_first50 contains the first 50 images of the ISIC Gallery (https://www.isic-archive.com/#!/topWithHeader/onlyHeaderTop/gallery).
  
  The other two datasets used in the paper (the test dataset and the training dataset from the ISIC 2016 Challenge) are available at https://challenge.isic-archive.com/data

  All the data in the datasets within directory DATASETS are among those licensed for free public download and use, under the CC-0 license (https://creativecommons.org/publicdomain/zero/1.0/).

- Directory SPECIFICATION contains the specification used to perform the analysis.    

  The model checker used to perform the analysis is VoxLogicA (version 0.6.0_osx-x64), a tool for analysing images using ImgQL specifications available at https://github.com/vincenzoml/VoxLogicA. 

- Directory OUTPUT contains the results of the analysis. Specifically:
  - nevusSegm_V15_2021_01_12_19H00_nevSegV0_FINAL_first10.csv is the file reporting the similarity scores for the analysis of the images in data_first10 
  - nevusSegm_V15_2021_01_12_19H00_nevSegV0_FINAL_first50.csv is the file reporting the similarity scores for the analysis of the images in data_first50 
  - nevusSegm_V15_2021_01_12_19H00_nevSegV0_FINAL_TestData.csv is the file reporting the similarity scores for the analysis of the images in TestData 
  - nevusSegm_V15_2021_01_12_19H00_nevSegV0_FINAL_TrainingData.csv is the file reporting the similarity scores for the analysis of the images in TrainingData 

-------------------------------------------------------------------------------------
Directory "Using_Spatial_Logic_and_Model_Checking_for_Nevus_Segmentation" contains all the specification, the dataset and the results of the analysis described in the paper "Using Spatial Logic and Model Checking for Nevus Segmentation" available at https://arxiv.org/abs/2012.13289. Specifically:

- Directory DATASETS contains the datasets used to perform the analysis:
  - data_first10 contains the first 10 images of the ISIC Gallery (https://www.isic-archive.com/#!/topWithHeader/onlyHeaderTop/gallery).
  - data_first50 contains the first 50 images of the ISIC Gallery (https://www.isic-archive.com/#!/topWithHeader/onlyHeaderTop/gallery).
  
  The other two datasets used in the paper (the test dataset and the training dataset from the ISIC 2016 Challenge) are available at https://challenge.isic-archive.com/data

  All the data in the datasets within directory DATASETS are among those licensed for free public download and use, under the CC-0 license (https://creativecommons.org/publicdomain/zero/1.0/).

- Directory SPECIFICATION contains the specification used to perform the analysis. 

  The model checker used to perform the analysis is VoxLogicA (version 0.6.0_osx-x64), a tool for analysing images using ImgQL specifications available at https://github.com/vincenzoml/VoxLogicA.

- Directory OUTPUT contains the results of the analysis. Specifically:
  - nevusSegm_v8d_2020_10_08_16h52_nevSegV0_CLEAN_public_first10-stats.csv is the file reporting the similarity scores for the analysis of the images in data_first10
  - nevusSegm_v8d_2020_10_08_16h52_nevSegV0_CLEAN_public_first50-stats.csv is the file reporting the similarity scores for the analysis of the images in data_first50
  - data_first10 is the directory containing a sub-directory for each image in data_first10. Each sub-directory contains the images resulting from the analysis.
  - data_first50 is the directory containing a sub-directory for each image in data_first50. Each sub-directory contains the images resulting from the analysis.