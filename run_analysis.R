
# reading data files from current working directory getwd()
# -- Read train data and subject
# --1. Merge train and test data
x_train_data <- read.table("UCI_HAR_Dataset/train/X_train.txt") 
y_train_data <- read.table("UCI_HAR_Dataset/train/y_train.txt")
train_subject<- read.table("UCI_HAR_Dataset/train/subject_train.txt")

# -- Read test data and subject
x_test_data <- read.table("UCI_HAR_Dataset/test/X_test.txt")
y_test_data <- read.table("UCI_HAR_Dataset/test/y_test.txt")
test_subject<- read.table("UCI_HAR_Dataset/test/subject_test.txt")

join_x_data <- rbind(x_train_data, x_test_data)
join_y_data <- rbind(y_train_data, y_test_data)
subject_data <- rbind(train_subject, test_subject)


# --2. Get only the mean and std for each measurement.
features <- read.table("UCI_HAR_Dataset/features.txt")
dim(features)
mean_std <- grep("mean\\(\\)|std\\(\\)", features[, 2])
length(mean_std)
join_x_data <- join_x_data[, mean_std]
dim(join_x_data)
names(join_x_data) <- gsub("\\(\\)", "", features[mean_std, 2])
names(join_x_data) <- gsub("mean", "Mean", names(join_x_data)) # Uppercase M
names(join_x_data) <- gsub("std", "Std", names(join_x_data)) # Uppercase S
names(join_x_data) <- gsub("-", "", names(join_x_data)) # remove "-" in column names 


# --3. Have descriptive  acivity names to name the activities in the datset.
# -- Read the activity labels, lowercase all the characters in the second column.
activity <- read.table("UCI_HAR_Dataset/activity_labels.txt") 
activity[, 2] <- tolower(gsub("_", "", activity[, 2]))  
substr(activity[2, 2], 8, 8) <- toupper(substr(activity[2, 2], 8, 8)) # Camelcase Upstairs & Downstairs
substr(activity[3, 2], 8, 8) <- toupper(substr(activity[3, 2], 8, 8))
activityLabel <- activity[join_y_data[, 1], 2]
join_y_data[, 1] <- activityLabel
names(join_y_data) <- "activity"

# --4. Properly label the dataset with descriptive names.
names(subject_data) <- "subject"
cleandata <- cbind(subject_data, join_y_data, join_x_data)
dim(cleandata) # 10299*68
write.table(cleandata, "merged_data_set.txt") # First dataset


# --5. Writeout a second, independent tidy data set with the average of
# each variable for each activity and each subject. 
subjectLen <- length(table(subject_data)) # 30
activityLen <- dim(activity)[1] 
columnLen <- dim(cleandata)[2]
result <- matrix(NA, nrow=subjectLen*activityLen, ncol=columnLen)
result <- as.data.frame(result)
colnames(result) <- colnames(cleandata)
row <- 1
for(i in 1:subjectLen) {
    for(j in 1:activityLen) {
        result[row, 1] <- sort(unique(subject_data)[, 1])[i]
        result[row, 2] <- activity[j, 2]
        bool1 <- i == cleandata$subject
        bool2 <- activity[j, 2] == cleandata$activity
        result[row, 3:columnLen] <- colMeans(cleandata[bool1&bool2, 3:columnLen])
        row <- row + 1
    }
}
head(result)
write.table(result, "tidy_data_set.txt") #  Second dataset