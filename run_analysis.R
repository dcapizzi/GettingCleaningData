## Part 1: Import data and unzip file

## Checks to see if the working directory has a folder called data. If not, creates
## a folder named "data."

if (!file.exists("data")) {
      dir.create("data")
}

## Downloads the source data from the provided fileUrl to the "data" folder 
## in the working directory; saves the date downloaded. Only downloads if the data
## is not already present in the working directory.

if (!file.exists("./data/UCI HAR Dataset")) {
     
      fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
      download.file(fileUrl, destfile = "./data/data.zip", method = "curl")
      dateDownloaded <- date()

      ## Unzips the downloaded "data.zip" file into the data folder. The unzipped
      ## contents result in a new folder called "UCI HAR Dataset" with the 
      ## test and training data files to be imported.

      unzip("./data/data.zip", exdir = "./data")}

## Part 2: Import data and consolidate into training and test data frames

## Part 2A: Import general variables
## Imports general data required to create the tidy dataset

activities <- read.table("./data/UCI HAR Dataset/activity_labels.txt") ## Activity table 
features <- read.table("./data/UCI HAR Dataset/features.txt") ## x column headings

## Part 2B: Imports and consolidate "train" data table
## Imports train data required to create tiny data set and combines to "train" data table

y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt") ## Train activites
x_train <- read.table("./data/UCI HAR Dataset/train/x_train.txt") ## Train x variables
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt") ## Train subjects

colnames(x_train) <- features[,2] ## Attaches column headings to x train variables
train <- cbind("train", subject_train, y_train, x_train) ## Binds a "train" column
## to preserve the "training" elements upon mering, as well as subjects, 
## activities, and x variables into "train" data table

colnames(train)[1:3] <- c("set", "subject", "activityindex") ## Names remaining columns in train

remove(y_train, x_train, subject_train) ## Removes consoldiated variables from workspace

## Part 2C: Import and consolidate "test" data table

## Imports test data required to create tiny data set and combines to "test" variable
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt") ## Test activities
x_test <- read.table("./data/UCI HAR Dataset/test/x_test.txt") ## Test x variables
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt") ## Test subjects

colnames(x_test) <- features[,2] ## Attaches column headings to x test variables

test <- cbind("test", subject_test, y_test, x_test) ## Binds a "test" column
## to preserve the "test" data, as well as subjects, activities, and x variables into
## "test" data table

colnames(test)[1:3] <- c("set", "subject", "activityindex") ## Names remaining columns in test

remove(y_test, x_test, subject_test) ## Removes consoldiated variables from workspace

## Part 3: Merges the training and the test sets to create one data set 

data <- rbind(train, test) ## Binds full train and test sets into one data frame
remove(train, test, features) ## Removes consoldiated variables from workspace

## Part 4:Extracts only the measurements on the mean and standard deviation for each measurement
varMeans <- grep("mean\\(\\)", colnames(data),ignore.case = TRUE) ## Identifies rows with "mean()" in row name
varStds <- grep("std\\(\\)", colnames(data),ignore.case = TRUE) ## Identifies rows with "std()" in row name
subsetData<- data[,c(1,2,3,varMeans,varStds)] ## subsets data to set, subject, activity
## and the column names with "mean" or "std" in the column name
names(subsetData) <- tolower(gsub("-",".",names(subsetData),)) ## Removes "-" from variable names
names(subsetData) <- tolower(gsub("\\(\\)","",names(subsetData),)) #3 Removes "()" from variable names
remove(varMeans,varStds) ## Removes consoldiated variables from workspace

## Part 5: Uses descriptive activity names to name the activities in the data set
subsetData <- cbind(index = seq_len(nrow(subsetData)), subsetData) ## Binds an index to maintain order of variables
subsetData <- merge(activities, subsetData, by.x = "V1", by.y = "activityindex") ## Merges activities
subsetData <- subsetData[order(subsetData$index), ] ## Reorders by index values
colnames(subsetData)[1:2] <- c("activityindex","activity") ## Adds columns to descriptive acitivities
row.names(subsetData) <- NULL ## Removes old row names
subsetData <- subsetData[,c(5,2,6:71)] ## Reorders columns to subject, activity, variables ...
remove(activities) ## Removes consoldiated variables from workspace

## Part 6: Creates tidy data set with average of each variable for each activity and subject
library(reshape2) ## Loads reshape2 package
meltData <- melt(subsetData, id = c("subject", "activity")) ## Melts data
tidyData <- dcast(meltData, subject + activity ~ variable, mean) ## Reshapse to mean of subject
## and activity pairs
remove(meltData) ## Removes meltData file

## Part 7: Output data files
write.csv(tidyData, "./tidydata.csv", row.names = FALSE)
write.csv(subsetData, "./subsetdata.csv", row.names = FALSE)