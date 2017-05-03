#1.Merges the training and the test sets to create one data set.

#1.1 Download dataset
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip")

#1.2 Unzip dataSet to /data directory
unzip(zipfile="./data/Dataset.zip",exdir="./data")

#1.3 Read and assign variable for tables from training group files

#Loading training set data:
traindata<-read.table("./data/UCI HAR Dataset/train/X_train.txt")

#Loading training set labels (activity types):
trainlabels<-read.table("./data/UCI HAR Dataset/train/y_train.txt")

#Loading subject IDs for the training group:
subjtrain<-read.table("./data/UCI HAR Dataset/train/subject_train.txt")

#1.4 Read and assign variables for tables from test group files

#Loading test set data:
testdata<-read.table("./data/UCI HAR Dataset/test/X_test.txt")

#Loading test set labels (activity types):
testlabels<-read.table("./data/UCI HAR Dataset/test/y_test.txt")

#Loading subject IDs for the test group:
subjtest<-read.table("./data/UCI HAR Dataset/test/subject_test.txt")

#1.5 Load the column variables for training and test datasets:
columnlabels<-read.table('./data/UCI HAR Dataset/features.txt')

#1.6 Load activity labels for testlabels and traininglabels:
activitylabels=read.table('./data/UCI HAR Dataset/activity_labels.txt')

#1.7 Assign column labels to various sets:
colnames(traindata)= columnlabels[,2]
colnames(testdata)= columnlabels[,2]
colnames(activitylabels)=c('activityID','activityTYPE')
colnames(subjtrain)="subjectID"
colnames(subjtest)="subjectID"
colnames(trainlabels)="activityID"
colnames(testlabels)="activityID"

#1.8 Merge trainingdatasets
mergedtrain<- cbind(trainlabels,subjtrain,traindata)

#1.9 Merge testdatasets
mergedtest<- cbind(testlabels,subjtest,testdata)

#1.10 Merge bothdatasets
mergeddata<-rbind(mergedtrain,mergedtest)

#2.Extracts only the measurements on the mean and standard deviation for each measurement.

#2.1 Create a vector with the column names
mergeddatacolumnnames<-colnames(mergeddata)

#2.2 Create a vector that selects the column variable we are interested in 
#which are: activityID, subjectID, anything with mean(mean()) and standard deviation (std())
logicgateformeanandstddev<-(grepl("activityID", mergeddatacolumnnames)|
                    grepl("subjectID", mergeddatacolumnnames)|
                    grepl("mean", mergeddatacolumnnames)|
                    grepl("std", mergeddatacolumnnames)
                )
#2.3 Use the logic gate to filter out the desired data for mean and stddev of each category
meanandstddevs<- mergeddata[logicgateformeanandstddev==TRUE]

#3.Uses descriptive activity names to name the activities in the data set.
mergeddata2<-merge(activitylabels,mergeddata,by="activityID")

#4.Appropriately labels the data set with descriptive variable names.
names(mergeddata2)
#Columns variables were already labelled earlier during part 1 - #1.7 :) :) :)

#5.From the data set in step 4, creates a second, independent tidy data set with the 
#average of each variable for each activity and each subject.
tidy1<- aggregate(.~subjectID+activityID, mergeddata2, mean)
tidy1columnnames<-colnames(tidy1)
logicgatetoremoveactivityTYPE<-(!grepl("activityTYPE",tidy1columnnames))
tidydataset<- tidy1[logicgatetoremoveactivityTYPE==TRUE]
#5.1 Write tidy data set as a .txt output
write.table(tidydataset, "tidydataset.txt", row.name=FALSE)
