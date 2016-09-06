###############################################################################
# Date : 09-05-2016
# 
# Data cleaning course project script run_analysis.R
#
# This script assumes that "UCI HAR Dataset" directory is unzipped in your 
# working directory
#
# The resulting output table should be read by read.table, by using headers = TRUE
###############################################################################

# These packages should be installed in your computer (or it will prompt you to install them):
require(dplyr)

# Find the path of desired files to construct test and training data sets

target <- dir(".", pattern = "^(X|y|subject)", recursive = TRUE)

# Find the feature names to label measurements

feature_file <- dir(".", "features.txt", recursive = TRUE )
features <- read.table(feature_file, header = FALSE, stringsAsFactors = FALSE)
features <- features$V2 # keep features as a character vector

# construct the test_data
test_files <- sapply(c(target[1],target[3],target[2]), read.table, header= FALSE, 
                     stringsAsFactors =FALSE)
test_data <- as.data.frame(test_files)
colnames(test_data) <- c("subject", "activity", features)

# construct the training_data
training_files <- sapply(c(target[4],target[6],target[5]), read.table, header= FALSE, 
                         stringsAsFactors =FALSE)

training_data <- as.data.frame(training_files)
colnames(training_data) <- c("subject", "activity", features)

# Merge the training and the test sets to create one data set.
merged_data <- rbind(test_data,training_data)

# Extract only the measurements on the mean and standard deviation for each measurement.

extraction_index <- grep("(mean|std)()[^Freq]", colnames(merged_data)) 

select_data <- merged_data[,c(1,2,extraction_index)]

# Use descriptive activity names to name the activities in the data set

act_lab_file <- dir(".", pattern = "activity_labels", recursive = TRUE)

activity_labels <- read.table(act_lab_file, header = F, stringsAsFactors = FALSE)

select_data$activity <- factor(select_data$activity, levels = c(1,2,3,4,5,6),
                               labels = activity_labels$V2)

# Appropriately label the data set with descriptive variable names.

colnames(select_data) <- gsub("Acc","_acceleration_", colnames(select_data))
colnames(select_data) <- gsub("Gyro","_gyroscope_", colnames(select_data))
colnames(select_data) <- gsub("Mag","_magnitude_", colnames(select_data))
colnames(select_data) <- gsub("^f","frequency_", colnames(select_data))
colnames(select_data) <- gsub("^t","time_", colnames(select_data))
colnames(select_data) <- gsub("_-","_",colnames(select_data) )
colnames(select_data) <- gsub("__","_",colnames(select_data) )
colnames(select_data) <- gsub("[()]","",colnames(select_data) )
colnames(select_data) <- gsub("-","_",colnames(select_data) )

# From the tidy data set, creates a second, independent tidy data set with 
# the average of each variable for each activity and each subject

final_summary <- select_data %>% select(subject, activity) %>% 
        group_by(subject,activity) %>% summarize(counts = n())

for( i in 3:ncol(select_data)) {
mean_table <- select_data %>% select(subject,activity,variable= i) %>% 
        group_by(subject, activity) %>% 
        summarize(mean(variable)) 
colnames(mean_table) <- gsub("variable", colnames(select_data)[i],colnames(mean_table))

final_summary <- full_join(final_summary,mean_table, by = c("subject", "activity"))        
}


final_summary <- final_summary[,-(grep("counts", colnames(final_summary)))]

colnames(final_summary) <- gsub("[(]","_",colnames(final_summary) )
colnames(final_summary) <- gsub("[)]","",colnames(final_summary) )

# Write the final summary table

write.table(final_summary, file = "average_variable_summary_by_activity_and_subject.txt",
            row.names = FALSE)

