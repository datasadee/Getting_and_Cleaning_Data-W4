# This script do the following....
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive activity names.
# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# use for melt function
library(reshape2)

# read data....
features <- read.table("data/features.txt")[,2]
activities <- read.table("data/activity_labels.txt")[,2]
x_test_data <- read.table("data/test/X_test.txt")
y_test_data <- read.table("data/test/y_test.txt")
x_train_data <- read.table("data/train/X_train.txt")
y_train_data <- read.table("data/train/y_train.txt")
subject_test <- read.table("data/test/subject_test.txt")
subject_train <- read.table("data/test/subject_train.txt")

# setting column names for x-axls
names(x_test_data) = features
names(x_train_data) = features
x_test_data = x_test_data[,grepl("mean|std", features)]
x_train_data = x_train_data[,grepl("mean|std", features)]

# setting labels for y-axls and rename y columns
y_test_data[,2] = activities[y_test_data[,1]]
y_train_data[,2] = activities[y_train_data[,1]]
names(y_test_data) = c("ActivityID", "Activity")
names(y_train_data) = c("ActivityID", "Activity")

# add colnames for subjects data
names(subject_test) = c("subjectID")
names(subject_train) = c("subjectID")

# create table for test and train and combine tables
train <- cbind(subject_train, y_train_data, x_train_data)
test <- cbind(subject_test, y_test_data, x_test_data)
combined <- rbind(test, train)

# create the tidy data set
melted_data <- melt(combined, id=c("subjectID","ActivityID", "Activity"))
tidy_table = dcast(melted_data, subjectID + Activity ~ variable, mean)
write.table(tidy_table, file = "./tidy_table.txt")