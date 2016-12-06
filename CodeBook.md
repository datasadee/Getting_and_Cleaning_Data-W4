# CodeBook

This codebook summarizes all the data, variables, along with units and relevant information about the script.

## Data Source

* data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* description of the data: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## The data

- 'features.txt': the column names of features of the x_train and x_test data.

- 'activity_labels.txt': Activity names, which activityID maps to.

- 'train/subject_train': subjectID of the train samples

- 'train/X_train.txt': Feature and their scores on train data.

- 'train/y_train.txt': ActivityID of the train samples

- 'test/subject_test': subjectID of the test samples.

- 'test/X_test.txt': Features and their score on test data.

- 'test/y_test.txt': ActivityID of the test samples.

## Process

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.