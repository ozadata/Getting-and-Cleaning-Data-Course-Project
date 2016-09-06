# Getting-and-Cleaning-Data-Course-Project
Data cleaning course project script run_analysis.R


# run_analysis.R

**Date** : 09-05-2016

**Title**: Data cleaning course project script run_analysis.R

**Purpose** : to generate a tidy form and provide a subject and activity-based summary 
of the dataset collected from the accelerometers from the Samsung Galaxy S smartphone.

**http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones**

** Importnat Note** : This script assumes that "UCI HAR Dataset" directory is unzipped and present in your working directory.

** It also requires dplyr package to run.

This script performs  a series of operations that can be summarized as:

1. Merge the training and the test sets to create one data set.
2. Extract only the measurements on the mean and standard deviation for each measurement.
3. Use descriptive activity names to name the activities in the data set
4. Labels the data set with descriptive variable names **(see the enclosed codebook for the detaile description of the variable names and units).**
5. From the data set in step 4, creates an independent tidy data set with the average of each variable for each activity and each subject.

The resulting output is **"average_variable_summary_by_activity_and_subject.txt"** 

Note :The resulting output table should be read by read.table, by using headers = TRUE
