Course Project - Getting and Cleaning Data, Coursera
====================================================

This script is for the course project of the [Getting and Cleaning Data course](https://www.coursera.org/course/getdata) on Coursera

### Script Description

The script handles downloading and extracting of the data before cleaning it according to the following specifications.

* Merges testing and training data to one data set
* Extracts mean and standard deviation values only for each measurement
* Uses descriptive activity names for measurements (instead of integer constants)
* Labels the data with descriptive variable names
* Creates a separate data set with average of each variable for each activity and subject

To do this, first the script reads in from the downloaded data.

* X and Y values are obtained for both test and train data and combined
* Feature descriptions are read from the features.txt file
* Activity descriptions are read from the activity_labels.txt file
* The subjects for each observation are read from the subject_test.txt and subject_train.txt files

To find only the values for means and standard deviation values, the feature descriptions are checked for substrings containing mean() or std(), with features containing either substring included.

To obtain the final tidy data set, the aggregate function is utilized.

## Codebook

Values are normalized and bounded within [-1,1].
More information can be found by consulting the README.txt included in the downloaded dataset.

Dataset is downloaded from [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

Full description is available at [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
