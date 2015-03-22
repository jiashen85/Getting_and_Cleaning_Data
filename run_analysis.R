#Step1:Merges the training and the test sets to create one data set
X_test<-read.table("./test/X_test.txt")
feature<-read.table("./features.txt")
names(X_test)<-feature$V2
#above is to assign the features to be column names
X_train<-read.table("./train/X_train.txt")
feature<-read.table("./features.txt")
names(X_train)<-feature$V2
#above is to assign the same features to be column names because rbind()requires same columns.
rawdata<-rbind(X_test,X_train)
#combine the X-test and X_train together to be one dataset.

subject1<-read.table("./test/subject_test.txt")
subject2<-read.table("./train/subject_train.txt")
joint<-rbind(subject1,subject2)
names(joint)<-"subject"
#above is to read the subject file for test and training groups and rbinding them into be one dataset and then assign "subject" to be its name. 

#Step3:Uses descriptive activity names to name the activities in the data set
nact1<-read.table("./test/y_test.txt")
nact2<-read.table("./train/y_train.txt")
activity<-rbind(nact1,nact2)
#above is to read the activity code  file for test and training groups and rbinding them to be one dataset.
activity$V1[activity$V1=="1"]<-"walking" 
activity$V1[activity$V1=="2"]<-"walking_upstairs"
activity$V1[activity$V1=="3"]<-"walking_downstairs"
activity$V1[activity$V1=="4"]<-"sitting"
activity$V1[activity$V1=="5"]<-"standing"
activity$V1[activity$V1=="6"]<-"laying"
#above is to replace the code with descriptive name. 
names(activity)<-"activity"
#above is to assign the new column name to be "activity".

newdata<-cbind(joint,activity,rawdata)
names(newdata)[1:5]
dim(newdata)
#above is to column combine the subject and activity into the previous data set.It has 10299 rows and 563 rows. 
#This newdata will be used for the below data processing. 

#Step2: Extracts only the measurements on the mean and standard deviation for each measurement.

library(dplyr)
library(gdata)
v_colnames<-make.names(names=names(newdata),unique=T,allow_=T)
#using make.names() can clean up the naming convention a little. e.g. fBodyGyro-bandsEnergy()-17,32 becomes fBodyGyro.bandsEnergy.17.32. as "dot" is allowed in the R naming convention. 
#see link here: https://stat.ethz.ch/R-manual/R-devel/library/base/html/make.names.html
names(newdata)<-v_colnames
#reassign the newdata name to be valid/R readable column names. 

good<-matchcols(newdata,with=c("mean()","std()"),without="Mean",method="or")
#using matchcols() to find any column names with "mean()" and "std()" and exclude "Mean" which is not real means.It returns a list of names. 
good1<-unlist(good)
#use unlist()to make the extracted column name same class as the names(newdata) which is a character vector. 
new<-newdata[,c(1:2,match(good1,names(newdata)))]
#using match() to find all the matched relevant names in the names(newdata) vector and combine with the first and second column (subject and activity) to be the columns need to be subset.  

head(new,n=5)
dim(new)
names(new)
#above is to test out if the output is what i want. By that, we find the column names are not tidy enough.

#Step4:Appropriately labels the data set with descriptive variable names.
new1<-gsub("\\.\\..","\\_\\" ,names(new))
new2<-gsub("\\.\\.","",new1)
View(new2)
#the above code is to tidy the column names to be more readable.
names(new)<-new2
#above is to assign back the names that is more descriptive and readable than what the feature.txt file provided.

#Step5:creates a second, independent tidy data set with the average of each variable for each activity and each subject.
newf<-group_by(new,subject,activity)
#using group_by() to group all the values under each subject and each activity.
tidy_data<-summarise_each(newf,funs(mean))
#the final dataset is required to have the average value of each variable for each subject and activity. 
head(tidy-data[,1:5],10)
#you can test the result by running the above code. 

write.table(tidy_data,file="./tidy_data.txt",row.names=FALSE)


