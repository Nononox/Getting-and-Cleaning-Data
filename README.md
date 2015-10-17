# Getting and Cleaning Data Course Project

The code run_analysis.R can be ran with the source data files downloaded and extracted to be in a holder named "UCI HAR Dataset". 

## How it works:

# 1. Merges the training and the test sets to create one data set.

Row 4 sets the working directory to my local working environment. This may vary by cases. 
Row 5 to row 14 create the dataset. 

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

Row 17 to row 21 extract the column names from for the dataset.
Row 22 extracts only the mean() and std(), as I believe that meanfreq() and stdfreq() are not counted as deviation.

# 3. Uses descriptive activity names to name the activities in the data set.
# 4. Appropriately labels the data set with descriptive variable names. 

Row 23 to row 27 added variable names to the dataset.

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Row 28 to the end create an independent tidy data by aggregating by subject and variable.
