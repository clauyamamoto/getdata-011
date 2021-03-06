## Project Assignment for Getting and Cleanning Data

This repository contains artifacts for Project assignment. It contains the following files:
* **README.md**: this file
* **run_analysis.R**: R script that gets and cleans data
* **code_book.md**: code book describing variables
* **Project_result.txt**: sample result set of Tidy file
Complete details about Project assigment can be found in the end of this file.

### How run_analysis.R works

#### Pre Requirements
1. Prior to running the script, download the zip file provided in this link <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>
2. Extract files and save them in your working directory 

#### Assumption
All required files are under the folder ./UCI HAR Dataset/ in your working directory

#### Part A - read Reference files
1. Read features file (UCI HAR Dataset/features.txt)
2. Reads\ activity labels file (UCI HAR Dataset/activity_labels.txt)
3. Create a list of features that are related to STD or MEAN

#### Part B - read Trainning dataset
1. Read training files (UCI HAR Dataset/train/y_train.txt, subject_train.txt, and x_train.txt)
2. Selects only data points related to STD and MEAN features
3. Update column names with descriptive feature names
4. update activity descriptions
5. Binds training data

#### Part C - read Testing dataset
1. Read training files (UCI HAR Dataset/test/y_test.txt, subject_test.txt, and x_test.txt)
2. Selects only data points related to STD and MEAN features
3. Update column names with descriptive feature names
4. update activity descriptions
5. Binds testing data

#### Part D - merge trainning data and testing data 
1. Merge trainning and testing datasets
2. Calculate  average of each variable for each activity and each subject
3. Rename columns of the new result set

#### Part E - Write Data into a txt file 

#### Part F (Optional) - read the file saved to confirm data is as expected




## Project Assignment Description
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones> 

Here are the data for the project: 

<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip> 

 You should create one R script called run_analysis.R that does the following. 
Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement. 
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names. 
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.






