
#assumptions:
# using the following dataset
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
# prior to running this script 
# dataset has been downloaded and is extracted in the working directory 
# all files are under the folder ./UCI HAR Dataset/ 
#-----------------------------
#Part A : read reference files
#-----------------------------
#Step A1: read features file
feature <- read.table("UCI HAR Dataset/features.txt")

#Step A2: reads activity labels file
activity <- read.table("UCI HAR Dataset/activity_labels.txt")

#Step A3: get features that are related to STD or MEAN
feature_std_mean <- grep("std|mean", feature$V2)

#-----------------------
#Part B: read train data
#------------------------
#Step B1: read train files
train_label <-read.table("UCI HAR Dataset/train/y_train.txt")
train_subject <- read.table("UCI HAR Dataset/train/subject_train.txt")
train_set <- read.table("UCI HAR Dataset/train/x_train.txt")

#Step B2: get data points related to STD and MEAN features
train_set_std_mean<-train_set[,feature_std_mean]

#Step B3: Update column names with descriptive feature names
colnames(train_label) <- "Activity"
colnames(train_subject) <- "Subject"
colnames(train_set_std_mean) <- feature[feature_std_mean, 2]

#Step B4: update activity descriptions
train_label$Activity<- factor(train_label$Activity, levels = activity$V1, labels = activity$V2)

#Step B5: Bind train datarename columns of the ne
trainData<-cbind(train_subject,train_label,train_set_std_mean)

#-----------------------
#Part C: read test data
#------------------------
#Step C1: read test files
test_label <-read.table("UCI HAR Dataset/test/y_test.txt")
test_subject <- read.table("UCI HAR Dataset/test/subject_test.txt")
test_set <- read.table("UCI HAR Dataset/test/x_test.txt")

#Step C2: get data points related to STD and MEAN features
test_set_std_mean<-test_set[,feature_std_mean]

#Step C3: Update column names with descriptive feature names
colnames(test_label) <- "Activity"
colnames(test_subject) <- "Subject"
colnames(test_set_std_mean) <- feature[feature_std_mean, 2]

#Step C4: update activity descriptions
test_label$Activity<- factor(test_label$Activity, levels = activity$V1, labels = activity$V2)

#Step C5: Bind test data
testData<-cbind(test_subject,test_label,test_set_std_mean)


#--------------------------------------
#Part D: Merge train data and test data
#--------------------------------------
#Step D1: merge datasets
allData <-rbind(trainData,testData)
head(allData)

#Step D2: calculate  average of each variable for each activity and each subject
result <- aggregate(allData[,3:81], by = list(allData$Subject, allData$Activity), FUN = mean)

#Step D3: rename columns of the new result set
colnames(result)[1:2] <- c("Subject", "Activity")

#--------------------------------------
#Part E: Write Data into a txt file
#--------------------------------------
write.table(result, file="Project_Result.txt", row.names = FALSE, sep = "\t")


#--------------------------------------------------------------------
#Part F: Optional, read the file saved to confirm data is as expected
#--------------------------------------------------------------------
data <- read.table("Project_Result.txt", header = TRUE)
View(data)
