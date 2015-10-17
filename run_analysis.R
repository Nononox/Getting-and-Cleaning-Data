# Created by Ran Tao 20151015

# library(sqldf);
setwd("/Users/Nononox/Documents/Study/[Coursera] Getting and Cleaning Data/Course Project/Work");
X_train <- read.table("UCI HAR Dataset/train/X_train.txt");
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt");
y_train <- read.table("UCI HAR Dataset/train/y_train.txt");
X_test <- read.table("UCI HAR Dataset/test/X_test.txt");
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt");
y_test <- read.table("UCI HAR Dataset/test/y_test.txt");

training <- cbind(y_train, subject_train, X_train);
testing <- cbind(y_test, subject_test, X_test);
data <- rbind(training, testing);

# test <- read.table("UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt");
features <- read.table("UCI HAR Dataset/features.txt");
dictionary <- as.vector(features[2][,1]);
typeof(dictionary);
row_name <- c("Label", "subject", dictionary);
colnames(data) <- row_name;
subdata <- data[, c(1, 2, grep(".*mean\\(\\).*|.*std\\(\\).*", row_name, perl=TRUE, value=FALSE))];
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt");
activity <- as.vector(activity_labels[2][,1]);
for (i in 1: 6) {
    subdata$Label[subdata$Label == i] <- activity[i];
}
aggregated_mean <- aggregate(subdata[, 3:68], list(subdata$Label, subdata$subject), mean);
write.table(aggregated_mean, "result.txt", row.name=FALSE);
# result_test <- read.table("result.txt");
