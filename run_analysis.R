#1. Merges the training and the test sets to create one data set.

tmp1 <- read.table("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt")
tmp2 <- read.table("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt")
X <- rbind(tmp1, tmp2)

tmp1 <- read.table("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt")
tmp2 <- read.table("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt")
Sub <- rbind(tmp1, tmp2)

tmp1 <- read.table("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt")
tmp2 <- read.table("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt")
Y <- rbind(tmp1, tmp2)

#2. Extracts only the measurements on the mean and standard deviation for each measurement.

features <- read.table("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/features.txt")
right_features <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])

X <- X[, right_features]

names(X) <- features[right_features, 2]
names(X) <- gsub("\\(|\\)", "", names(X))
names(X) <- tolower(names(X))
names(X)



#3. Uses descriptive activity names to name the activities in the data set.

activities <- read.table("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt")
activities[, 2] = gsub("_", "", tolower(as.character(activities[, 2])))
Y[,1] = activities[Y[,1], 2]
names(Y) <- "activity"
names(Y)

#4. Appropriately labels the data set with descriptive activity names.

names(Sub) <- "subject"
cleaned <- cbind(Sub, Y, X)
write.table(cleaned, "merged_clean_data.txt")

#5. Creates a 2nd, independent tidy data set with the average of each variable for each activity and each subject.

uniqueSubjects = unique(Sub)[,1]
numSubjects = length(unique(Sub)[,1])
numActivities = length(activities[,1])
numCols = dim(cleaned)[2]
result = cleaned[1:(numSubjects*numActivities), ]
result

row = 1
for (s in 1:numSubjects) {
    for (a in 1:numActivities) {
        result[row, 1] = uniqueSubjects[s]
        result[row, 2] = activities[a, 2]
        tmp <- cleaned[cleaned$subject==s & cleaned$activity==activities[a, 2], ]
        result[row, 3:numCols] <- colMeans(tmp[, 3:numCols])
        row = row+1
    }
}
write.table(result, "data_set_with_averages.txt")



