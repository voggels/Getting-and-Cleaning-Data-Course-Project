#This file acts as a code book for analysis.R script.
#The following text will describe the variables used in analysis.R

#As mentioned in the README.md file, analysis.R script in this repo basically does the following 
#(in order to fulfill the course project objectives in "instructions.md"):

*traindata is a readout from X_train.txt within the dataset
*trainlabels is a readout from y_train.txt within the dataset
*subjtrain is a readout from subject_train.txt within the dataset
*testdata is a readout from X_test.txt within the dataset
*testlabels is a readout from y_test.txt within the dataset
*subjtest is a readout from subject_test.txt within the dataset
*columnlabels is a readout from features.txt within the dataset
*activitylabels is a readout from activity_labels.txt within the dataset

*mergedtrain is the combined dataset consisting of trainlabels,subjtrain and traindata
*mergedtest is the combined dataset consisting of testlabels,subjtest and testdata
*mergeddata is the combined dataset consisting of mergedtrain and mergedtest

*mergeddatacolumnnames consists of column names in mergeddata

*logicgateformeanandstddev is a logic filter to assign relevant 
columns (activityID, subjectID, anything with mean(mean()) and standard deviation (std())) as TRUE
*meanandstddevs consists of all columns consisting of activityID, subjectID and any variables with mean(mean()) and standard deviation.

mergeddata2 merges descriptive activity names in activitylabels to name their repective numerical codes.
tidy1 is an aggregate of all the variable means, of each activity carried out by each subject
tidy1columnnames consists of all the column names in tidy1.
logicgatetoremoveactivityTYPE is a logic filter to label activityTYPE as FALSE
tidydataset consists of all the column names in tidy1 except activityTYPE
