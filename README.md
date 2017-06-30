# STA5076Z Supervised Learning - Project 2017

Author: Corné Oosthuizen

This project involves the analysis of MNIST dataset and a Additional Dataset obtained from  

## Getting Started - Digits

* Extract `data/raw/mnist_data.zip` in the same folder.

* The various datasets will need to be generated, this takes quite a while to run, each one will produce the set as of files as shown below:

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

## Getting Started - Student Records

The dataset for the Student Records are already extracted in the data folder.

* Start by running:

  1. `run_student.R`: This generates a training ad test set from the available data (using `student-por.csv` because there are more observations)
    ```
        data/student/training.rds # training set 488 observations
        data/student/testing.rds  # testing set 161 observations
    ``` 
  2. `run_student_g1.R`: Run a list of learning models for the first period grade (numeric: from 0 to 20)[G1]
    ```
        data/results/student_<k>_g1.rds  # saved model
        ...
        data/results/student_g1.rds  # results of all the training
    ``` 
  2. `run_student_g2.R`: Run a list of learning models for the second period grade (numeric: from 0 to 20)[G2]
    ```
        data/results/student_<k>_g2.rds  # saved model
        ...
        data/results/student_g2.rds  # results of all the training
    ``` 
  3. `run_student_g3.R`: Run a list of learning models for the final grade (numeric: from 0 to 20, output target)[G3]
    ```
        data/results/student_<k>_g3.rds  # saved model
        ...
        data/results/student_g3.rds  # results of all the training
    ``` 
NOTE: _<k>_ being the list of models described

### Directory Structure

```
data/        # folder contains processed data - saved datasets
├── raw      # folder contains raw data for MNIST digits
└── student  # folder contains the student records

results/     # folder contains results of all the models run for both parts

# Generic scripts and methods that are used throughout for generating data and graphing (digits).
utils.R

# The dataset generation might cause some of the sizes for the final objects to be incorrect - this fixes the dataset_creation.csv file.
dataset_size_fixes.Rmd

# Create the images that is used in the final report.
report_create_images.Rmd

# Create Images for Cluster Analysis and Multdimentional Scaling - imported in report file.
report_mds.Rmd

# Report file - MAIN
report.Rmd

# Loading the training and testing set as well as the basic structure for saving model results.
run_student_utils.R
```

## References


P. Cortez and A. Silva. Using Data Mining to Predict Secondary School Student Performance. In A. Brito and J. Teixeira Eds., Proceedings of 5th FUture BUsiness TEChnology Conference (FUBUTEC 2008) pp. 5-12, Porto, Portugal, April, 2008, EUROSIS, ISBN 978-9077381-39-7. 



© University of Cape Town 2017. All rights reserved.
