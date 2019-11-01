## Getting and Cleaning Data - Final Project ##
## Author: Jack Sternal                    ##
## Date: 01 November 2019                  ##

library(dplyr) #Load the dplyr library

if (!file.exists("Final Project Data")){
  dir.create("Final Project Data") #Creates a directory for the final project data if it does not currently exist
}

setwd("./Final Project Data") #Sets the working directory to the "Final Project Data" directory that was created

dataURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" 

download.file(dataURL, "Final Project Dataset.zip")           #Downloads zipped folder of data files for final project

unzip("Final Project Dataset.zip")                            #Unzips data files for final project

featurelabs <- read.table("./UCI HAR Dataset/features.txt")   #Reads in the Features Labels for each of the 6 activities
feat <- t(featurelabs)                                        #Transposes the featurelabs so each feature is in a unique column (row 2)

xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt")   #Reads in the Training Dataset
names(xtrain) <- feat[2,]                                     #Renames training dataset columns to match the features from the features.txt file
xtrain <- xtrain[, grep("mean\\()|std\\()", colnames(xtrain))]#Subsets xtest to contain only columns with measurements on the mean and standard deviation for each measurement 

subjects1 <- read.table("./UCI HAR Dataset/train/subject_train.txt") #Imports the Training Subject IDs
names(subjects1) <- c("Subject_ID")                                  #Renames the one variable in subjects1 to "Subject_ID"

trainactivity <- read.table("./UCI HAR Dataset/train/y_train.txt") #Imports the Training Activities
names(trainactivity) <- c("Activity")                              #Renames the one variable in trainactivity to "Activity"

train_comp <- cbind(subjects1, trainactivity, xtrain)               #Merges the Training Subject IDs, Activities, and Accelerometer data in that order.
train_comp$Activity <- as.factor(as.character(train_comp$Activity)) #Classifies Activity varaible as factors, so it can be recoded in line 31 to the appropriate activity label

train_comp$Activity <- recode(train_comp$Activity, "1" = "WALKING", "2" = "WALKING_UPSTAIRS", "3" = "WALKING_DOWNSTAIRS", "4" = "SITTING", "5" = "STANDING", "6" = "LAYING")

xtest <- read.table("./UCI HAR Dataset/test/X_test.txt")            #Reads in the Test Dataset
names(xtest) <- feat[2,]                                            #Renames test dataset columns to match the features from the features.txt file
xtest <- xtest[, grep("mean\\()|std\\()", colnames(xtest))]         #Subsets xtest to contain only columns with measurements on the mean and standard deviation for each measurement 

subjects2 <- read.table("./UCI HAR Dataset/test/subject_test.txt") #Imports The Test Subject IDS
names(subjects2) <- c("Subject_ID")                                #Renames the one variable in subjects2 to "Subject_ID"

testactivity <- read.table("./UCI HAR Dataset/test/y_test.txt")    #Imports the Test Activities
names(testactivity) <- c("Activity")                               #Renames the one variable in testactivity to "Activity"

test_comp <- cbind(subjects2, testactivity, xtest)                 #Merge the Test Subject IDs, Activities, and Accelerometer data in that order
test_comp$Activity <- as.factor(test_comp$Activity)                #Classifies Activity varaible as factors, so it can be recoded in line 46 to the appropriate activity label

test_comp$Activity <- recode(test_comp$Activity, "1" = "WALKING", "2" = "WALKING_UPSTAIRS", "3" = "WALKING_DOWNSTAIRS", "4" = "SITTING", "5" = "STANDING", "6" = "LAYING")

Test_Train_Data_Combined <- rbind(test_comp, train_comp)        #Merge the Test and Training datasets using rbind. Since there are no IDs shared by the datasets, a merge would not be successful.

Test_Train_Data_Combined$Subject_ID <- as.factor(Test_Train_Data_Combined$Subject_ID) #Sets Subject IDs as factors for grouping for summarization

Test_Train_Data_Combined <- tbl_df(Test_Train_Data_Combined)                         #converts data frame to tbl
Test_Train_Data_Combined <- group_by(Test_Train_Data_Combined, Subject_ID, Activity) #Groups tbl by Subject ID and Activity

Test_Train_Data_Means <- summarize_all(Test_Train_Data_Combined, mean)               #Calculates the mean of each measurement variable, grouped by Subject ID and activity

write.table(Test_Train_Data_Means, "./Test_Train_Data_Means.txt", row.names = FALSE) #Exports table to .txt file
