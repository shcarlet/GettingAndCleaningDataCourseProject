library(dplyr)
# Features and activity labels
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("index", "feature"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))

# Train data
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")

# Test data
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")


x_all <- rbind(x_train, x_test)
y_all <- rbind(y_train, y_test)
subject_all <- rbind(subject_train, subject_test)

colnames(x_all) <- features$feature

merged_data <- cbind(subject_all, y_all, x_all)


mean_std_data <- merged_data %>%
  select(subject, code, contains("mean()"), contains("std()"))

mean_std_data$code <- activities[mean_std_data$code, 2]
colnames(mean_std_data)[2] <- "activity"


names(mean_std_data) <- gsub("Acc", "Accelerometer", names(mean_std_data))
names(mean_std_data) <- gsub("Gyro", "Gyroscope", names(mean_std_data))
names(mean_std_data) <- gsub("BodyBody", "Body", names(mean_std_data))
names(mean_std_data) <- gsub("Mag", "Magnitude", names(mean_std_data))
names(mean_std_data) <- gsub("^t", "Time", names(mean_std_data))
names(mean_std_data) <- gsub("^f", "Frequency", names(mean_std_data))
names(mean_std_data) <- gsub("tBody", "TimeBody", names(mean_std_data))
names(mean_std_data) <- gsub("-mean\\(\\)", "Mean", names(mean_std_data), ignore.case = TRUE)
names(mean_std_data) <- gsub("-std\\(\\)", "STD", names(mean_std_data), ignore.case = TRUE)
names(mean_std_data) <- gsub("-freq\\(\\)", "Frequency", names(mean_std_data), ignore.case = TRUE)
names(mean_std_data) <- gsub("angle", "Angle", names(mean_std_data))
names(mean_std_data) <- gsub("gravity", "Gravity", names(mean_std_data))


final_data <- mean_std_data %>%
  group_by(subject, activity) %>%
  summarise_all(list(mean = mean))


write.table(final_data, "tidy_data.txt", row.name = FALSE)



