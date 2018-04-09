# getting-cleaning-data-project

This project gets and cleans a set of data that can be found in the UCI Machine Learning Repository. It was collected from accelerometers from the Samsung Galaxy S smartphone.  The goal of the roject was to produce a tidy dataset that can be used for analysis.

You can read this data into R using the following code: 

data <- read.table("tidydata.txt", header = TRUE)
View(data)

# Raw Data

The data can be found here: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

A summary of the files from this location used by this project and their description is below. 

|file|Description|
|---|---|
| X_train.txt | The training dataset with the 70% training split of observations of 561 variables. Each was made by a particular subject performing a specific activity, found elsewhere.|
| X_test.txt | The test dataset with the 30% test split of observations of 561 variables. Each was made by a particular subject performing a specific activity, found elsewhere.|
| Y_train.txt | The corresponding numerical indicator (1-6) representing the activity performed for each row of the training data. |
| Y_test.txt | The corresponding numerical indicator (1-6) representing the activity performed for each row of the training data. |
| subject_train.txt | The corresponding number of the subject (1-30) for each row of the training data.  |
| subject_test.txt | The corresponding number of the subject (1-30) for each row of the test data.  |
| features.txt | The namesof the observations represented by the columns in the training & test datasets.  |
| activity_labels.txt | The translation table between numerical activity indicator (1-6) and the human readable description of the activity. |

## run_analysis.R

This script is used to process the data and output the final requirted dataset. 

The tasks this script performs are: 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.(NOTE: we have decided that raw observations denoted meanFreq() are not required and so are not included in the tidy dataset)
3. Uses descriptive activity names to name the activities in the data set 
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


It produces and saves a tidy dataset from step 5, tidydata.txt. You can read this data into R using the following code: 

data <- read.table("tidydata.txt", header = TRUE)
View(data)

## CodeBook.md

This markdown document provides the codebook that can be used to fully understand the tidy data output by run_analysis.md and saved in this project at tidydata.txt. 