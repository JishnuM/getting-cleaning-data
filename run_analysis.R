
## Download and extract the data

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
              "raw_data.zip",method="curl")
unzip("raw_data.zip")

## Read data
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
x_names <- read.table("UCI HAR Dataset/features.txt")
y_names <- read.table("UCI HAR Dataset/activity_labels.txt")
subjects_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
subjects_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

## Merge test and train data

x_merged <- rbind(x_test, x_train)
y_merged <- rbind(y_test, y_train)
subjects_merged <- rbind(subjects_test, subjects_train)

## Subsetting merged data set

subset_boolean = sapply(x_names$V2, function(x){
    grepl("mean()", x, fixed=TRUE) || grepl("std()", x, fixed=TRUE)
})
subset_names <- x_names[subset_boolean,]$V2
subset_x_merged <- x_merged[,subset_boolean]
names(subset_x_merged) <- subset_names

## Descriptive names for activity

y_descr <- sapply(y_merged, function(x) labels$V2[x])
colnames(y_descr) <- c("ACTIVITY")
colnames(subjects_merged) <- c("SUBJECT")

## Tidy data set

labelled_merged_data <- cbind(subjects_merged, y_descr, subset_x_merged)

final_tidy_data <- aggregate( . ~ SUBJECT + ACTIVITY, 
                             data = labelled_merged_data,
                             FUN = mean)

## Write to file

write.table(final_tidy_data, file="./tidy_data_output.txt")
