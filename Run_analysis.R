library(plyr)

##Set working directory to location of unzipped folder UCI HAR Dataset
setwd("/Users/kurtschuepfer1/UCI HAR Dataset")

##Give each file of interest a full path and assign them to objects
uci_hard_dir <- getwd()
feature_file <- paste(uci_hard_dir, "/features.txt", sep = "")
activity_labels_file <- paste(uci_hard_dir, "/activity_labels.txt", sep = "")
x_train_file <- paste(uci_hard_dir, "/train/X_train.txt", sep = "")
y_train_file <- paste(uci_hard_dir, "/train/y_train.txt", sep = "")
subject_train_file <- paste(uci_hard_dir, "/train/subject_train.txt", sep = "")
x_test_file  <- paste(uci_hard_dir, "/test/X_test.txt", sep = "")
y_test_file  <- paste(uci_hard_dir, "/test/y_test.txt", sep = "")
subject_test_file <- paste(uci_hard_dir, "/test/subject_test.txt", sep = "")

##Load all raw data
features <- read.table(feature_file, colClasses = c("character"))
activity_labels <- read.table(activity_labels_file, col.names = c("ActivityId", "Activity"))
x_train <- read.table(x_train_file)
y_train <- read.table(y_train_file)
subject_train <- read.table(subject_train_file)
x_test <- read.table(x_test_file)
y_test <- read.table(y_test_file)
subject_test <- read.table(subject_test_file)

#1)Merges the training and the test sets to create one data set.

training_sensor_data <- cbind(cbind(x_train, subject_train), y_train)
test_sensor_data <- cbind(cbind(x_test, subject_test), y_test)
sensor_data <- rbind(training_sensor_data, test_sensor_data)

##Create an object that specifies labels, then assign it to aggregate dataset
sensor_labels <- rbind(rbind(features, c(562, "Subject")), c(563, "ActivityId"))[,2]
names(sensor_data) <- sensor_labels

#2 Extracts only measurements that contain mean and std. dev. values 
##index mean columns with a non-case-sensitive search for "mean"
mean_col_index <- grep("mean", names(sensor_data), ignore.case=TRUE)
mean_col_names <- names(sensor_data)[mean_col_index]
##index std columns with a non-case-sensitive search for "std"
std_col_index <- grep("std", names(sensor_data), ignore.case=TRUE)
std_col_names <- names(sensor_data)[std_col_index]

sensor_data_mean_std <- sensor_data[,c("Subject","ActivityId",
        mean_col_names,std_col_names)]

#3 Uses descriptive activity names to name the activities in the data set
step3 <- join(sensor_data_mean_std, activity_labels, 
        by = "ActivityId", match = "first")
##Removes now unnecessary "ActivityId" column
step3b <- step3[,-1]

#4) Appropriately labels the data set with descriptive activity names.
colNames <- colnames(step3b)
for (i in 1:length(colNames)){
        colNames[i] = gsub("\\()","",colNames[i])
        colNames[i] = gsub("-std$","StdDev",colNames[i])
        colNames[i] = gsub("-mean","Mean",colNames[i])
        colNames[i] = gsub("^(t)","time",colNames[i])
        colNames[i] = gsub("^(f)","freq",colNames[i])
        colNames[i] = gsub("([Gg]ravity)","Gravity",colNames[i])
        colNames[i] = gsub("([Bb]ody[Bb]ody|[Bb]ody)","Body",colNames[i])
        colNames[i] = gsub("[Gg]yro","Gyro",colNames[i])
        colNames[i] = gsub("AccMag","AccMagnitude",colNames[i])
        colNames[i] = gsub("([Bb]odyaccjerkmag)","BodyAccJerkMagnitude",colNames[i])
        colNames[i] = gsub("JerkMag","JerkMagnitude",colNames[i])
        colNames[i] = gsub("GyroMag","GyroMagnitude",colNames[i])
}

colnames(step3b) <- colNames
write.table(step3b, file = "tidy.txt",row.names = FALSE) ## creates tidy data set

#5)  Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidy_mean <- ddply(melt(step3b, id.vars=c("Subject", "Activity")), .(Subject, Activity), summarise, MeanSamples=mean(value))
write.table(tidy_mean, file = "tidy_mean.txt",row.names = FALSE) ##creates tidy data set with means of each variable