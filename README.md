#Analysis.R script in this repo basically does the following (in order to fulfill the course project objectives in "instructions.md"):

#1.Merges the training and the test sets to create one data set.
#1.1 Download dataset
#1.2 Unzip dataSet to /data directory
#1.3 Read and assign variable for tables from training group files by:
#Loading training set data:
#Loading training set labels (activity types):
#Loading subject IDs for the training group:
#1.4 Read and assign variables for tables from test group files by:
#Loading test set data
#Loading test set labels (activity types)
#Loading subject IDs for the test group
#1.5 Load the column variables for training and test datasets:
#1.6 Load activity labels for testlabels and traininglabels:
#1.7 Assign column labels to various sets:
#1.8 Merge trainingdatasets
#1.9 Merge testdatasets
#1.10 Merge bothdatasets

#2.Extracts only the measurements on the mean and standard deviation for each measurement.
#2.1 Create a vector with the column names
#2.2 Create a vector that selects the column variable we are interested in 
#which are: activityID, subjectID, anything with mean(mean()) and standard deviation (std())
#2.3 Use the logic gate created in 2.2 to filter out the desired data for mean and stddev of each category
#3.Uses descriptive activity names to name the activities in the data set.

#4.Appropriately labels the data set with descriptive variable names (already carried out in #1)

#5.From the data set in step 4, creates a second, independent tidy data set with the 
#average of each variable for each activity and each subject 
3using aggregate function followed by a logicgate use to remove activityTYPE from the dataset
#5.1 Finally write tidy data set as a .txt output
