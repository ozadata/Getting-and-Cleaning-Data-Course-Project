# CodeBook: description of the data, its processing and resulting variables

Date : 09-05-2016

Purpose: Provide a detailed description of the data processing and variables produced
as a result of running the enclosed R script : run_analysis.R

# Data

The data processed by this script is obtained from wearable computing device, namely
accelerometers from the Samsung Galaxy S smartphone. Detailed information about the
data collection and reference to original publications can be found here:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

**REFERENCES**
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012


# Data acquisition 

The data was already processed in the form it was provided. The authors describe 
the original data as follows:

**The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.** 

**The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.** 

**The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.** 

**Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).**

**Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).**

The original (author-defined) variable-names for the data were:

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

# Data processing by run_analysis.R

The training and test data sets were merged to obtain a unified dataset. This includes
first constructing training and test data sets by using X-train/test data, y-train/test 
activity codes, and subject codes, then merging the resulting data frames by row.

Afterwards, a series of transformations were performed to tidy the data and perform the required summary: 

- First, we only focus on the measurements on the mean and standard deviation for each measurement. These are the measurements that end with mean() or std().

- Second, the activity codes in the "activity column" were replaced with 6 descriptive
activity names provided by the authors (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)

- Afterwards, the variable names were edited to make them **self-descriptive**,
based on the authors' description (see below for the improved variable names)

"Acc" replaced by "acceleration"
"Mag" replaced by "magnitude"
"Gyro"replaced by "gyroscope"

"f" prefix replaced by "frequency"
"t" prefix replaced by "time"

- Finally, a tidy summary data set was created. This new data set collapses the
data into an **average** of each variable for each activity performed by each subject.

- The resulting summary table has 180 observations and the following 68 variables:

 [1] "subject" : the code of subjects enrolled in the study
 [2] "activity": 6 distinct activities performed by the subjects and recorded during the experiments

** Time variables: UNITS : sec , described in the author description above **
** Note that the variables are provided as the average of each category in this summary table**

 [3] "mean_time_Body_acceleration_mean_X"
 [4] "mean_time_Body_acceleration_mean_Y"
 [5] "mean_time_Body_acceleration_mean_Z"
 [6] "mean_time_Body_acceleration_std_X"
 [7] "mean_time_Body_acceleration_std_Y"
 [8] "mean_time_Body_acceleration_std_Z"
 [9] "mean_time_Gravity_acceleration_mean_X"
[10] "mean_time_Gravity_acceleration_mean_Y"
[11] "mean_time_Gravity_acceleration_mean_Z"
[12] "mean_time_Gravity_acceleration_std_X"
[13] "mean_time_Gravity_acceleration_std_Y"
[14] "mean_time_Gravity_acceleration_std_Z"
[15] "mean_time_Body_acceleration_Jerk_mean_X"
[16] "mean_time_Body_acceleration_Jerk_mean_Y"
[17] "mean_time_Body_acceleration_Jerk_mean_Z"
[18] "mean_time_Body_acceleration_Jerk_std_X"
[19] "mean_time_Body_acceleration_Jerk_std_Y"
[20] "mean_time_Body_acceleration_Jerk_std_Z"
[21] "mean_time_Body_gyroscope_mean_X"
[22] "mean_time_Body_gyroscope_mean_Y"
[23] "mean_time_Body_gyroscope_mean_Z"
[24] "mean_time_Body_gyroscope_std_X"
[25] "mean_time_Body_gyroscope_std_Y"
[26] "mean_time_Body_gyroscope_std_Z"
[27] "mean_time_Body_gyroscope_Jerk_mean_X"
[28] "mean_time_Body_gyroscope_Jerk_mean_Y"
[29] "mean_time_Body_gyroscope_Jerk_mean_Z"
[30] "mean_time_Body_gyroscope_Jerk_std_X"
[31] "mean_time_Body_gyroscope_Jerk_std_Y"
[32] "mean_time_Body_gyroscope_Jerk_std_Z"
[33] "mean_time_Body_acceleration_magnitude_mean"
[34] "mean_time_Body_acceleration_magnitude_std"
[35] "mean_time_Gravity_acceleration_magnitude_mean"
[36] "mean_time_Gravity_acceleration_magnitude_std"
[37] "mean_time_Body_acceleration_Jerk_magnitude_mean"
[38] "mean_time_Body_acceleration_Jerk_magnitude_std"
[39] "mean_time_Body_gyroscope_magnitude_mean"
[40] "mean_time_Body_gyroscope_magnitude_std"
[41] "mean_time_Body_gyroscope_Jerk_magnitude_mean"
[42] "mean_time_Body_gyroscope_Jerk_magnitude_std"

** Frequency variables: UNITS : HZ, described in the author description above **
** Note that the variables are provided as the average of each category in this summary table**


[43] "mean_frequency_Body_acceleration_mean_X"
[44] "mean_frequency_Body_acceleration_mean_Y"
[45] "mean_frequency_Body_acceleration_mean_Z"
[46] "mean_frequency_Body_acceleration_std_X"
[47] "mean_frequency_Body_acceleration_std_Y"
[48] "mean_frequency_Body_acceleration_std_Z"
[49] "mean_frequency_Body_acceleration_Jerk_mean_X"
[50] "mean_frequency_Body_acceleration_Jerk_mean_Y"
[51] "mean_frequency_Body_acceleration_Jerk_mean_Z"
[52] "mean_frequency_Body_acceleration_Jerk_std_X"
[53] "mean_frequency_Body_acceleration_Jerk_std_Y"
[54] "mean_frequency_Body_acceleration_Jerk_std_Z"
[55] "mean_frequency_Body_gyroscope_mean_X"
[56] "mean_frequency_Body_gyroscope_mean_Y"
[57] "mean_frequency_Body_gyroscope_mean_Z"
[58] "mean_frequency_Body_gyroscope_std_X"
[59] "mean_frequency_Body_gyroscope_std_Y"
[60] "mean_frequency_Body_gyroscope_std_Z"
[61] "mean_frequency_Body_acceleration_magnitude_mean"
[62] "mean_frequency_Body_acceleration_magnitude_std"
[63] "mean_frequency_BodyBody_acceleration_Jerk_magnitude_mean"
[64] "mean_frequency_BodyBody_acceleration_Jerk_magnitude_std"
[65] "mean_frequency_BodyBody_gyroscope_magnitude_mean"
[66] "mean_frequency_BodyBody_gyroscope_magnitude_std"
[67] "mean_frequency_BodyBody_gyroscope_Jerk_magnitude_mean"
[68] "mean_frequency_BodyBody_gyroscope_Jerk_magnitude_std"
