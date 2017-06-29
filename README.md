# STA5076Z Supervised Learning - Project 2017

Author: Corné Oosthuizen

This project involves the analysis of MNIST dataset and a Additional Dataset obtained from  

## Getting Started

* Extract `data/raw/mnist_data.zip` in the same folder.

* Start by running:

  1. `dataset_creation_resize.Rmd`: Generates the rotated and resized versions of the dataset.
    ```
        data/train_<i>_.<ext>
        data/test_<i>_.<ext>
        data/dataset_creation_size.csv # description of size data files
    ``` 
  2. `dataset_creation_skeletonize.Rmd`: Generates the rotated, resized and skelotonised versions of the dataset.
    ```
        data/train_<i>_skel.<ext>
        data/test_<i>_skel.<ext>
        data/dataset_creation_skel.csv # description of skelotonised data files
    ``` 
  3. Combine `data/dataset_creation_size.csv` and `data/dataset_creation_skel.csv` to create `dataset_creation.csv`, this will be the master file from which all other transformations will read their descriptions.
  4. `dataset_creation_sym.Rmd`: Generates the symmetrical view of the dataset (only select data that has no symmetry yet).
    ```
        data/train_<i>_sym.<ext>
        data/test_<i>_sym.<ext>
        data/train_<i>_skel_sym.<ext>
        data/test_<i>_skel_sym.<ext>
        data/dataset_creation_sym.csv # ToDo: add to dataset_creation.csv
    ``` 
  5. `dataset_creation_symAdd.Rmd`: Add the symmetry variables to the existing datasets.
    ```
        data/train_<i>_symAdd.<ext>
        data/test_<i>_symAdd.<ext>
        data/train_<i>_skel_symAdd.<ext>
        data/test_<i>_skel_symAdd.<ext>
        data/dataset_creation_symAdd.csv # ToDo: add to dataset_creation.csv     
    ``` 
  6. `dataset_creation_pca.Rmd`: Calculate the PCA for all the datasets in the list (except the sets with only symmetry).
    ```
        data/train_<i>_symAdd_pca.<ext>
        data/test_<i>_symAdd_pca.<ext>
        data/train_<i>_skel_symAdd_pca.<ext>
        data/test_<i>_skel_symAdd_pca.<ext>
        data/dataset_creation_pca.csv # ToDo: add to dataset_creation.csv     
    ```

NOTE: _<i>_ is the size of the image and _<ext>_ is either a Comma Delimeted File _(csv)_ or a R Object File _(rds)_.

### Directory Structure

```
data/      # folder contains processed data
└── etc    # folder contains raw data

# Generic scripts and methods that are used throughout for generating data and graphing.
utils.R

# The dataset generation might cause some of the sizes for the final objects to be incorrect - this fixes the dataset_creation.csv file.
dataset_size_fixes.Rmd

# Create the images that is used in the final report.
report_create_images.Rmd

# Create Images for Cluster Analysis and Multdimentional Scaling - imported in report file.
report_mds.Rmd

# Report file - MAIN
report.Rmd
```

## References



P. Cortez and A. Silva. Using Data Mining to Predict Secondary School Student Performance. In A. Brito and J. Teixeira Eds., Proceedings of 5th FUture BUsiness TEChnology Conference (FUBUTEC 2008) pp. 5-12, Porto, Portugal, April, 2008, EUROSIS, ISBN 978-9077381-39-7. 



© University of Cape Town 2017. All rights reserved.
