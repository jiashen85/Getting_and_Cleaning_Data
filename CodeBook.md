Title: CodeBook/Data Dictionary for Course Project

Author: Tracy Shen

Date: Sunday, March 22, 2015

This codebook is created in the spirit of data dictionary per the course requirement "a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data". Link: https://class.coursera.org/getdata-012/human_grading/view/courses/973499/assessments/3/submissions. Hence, it is author's interpretation that the codebook is to explain the variables used or transformed to perofrm the analysis, not the variables of the data itself.The data variable explanation can be found under feature_info.txt file in the original data zip folder. 

The codebook is also composed under the guidance of Week1 lecture "Components of Tidy Data" :https://github.com/rdpeng/courses/blob/master/03_GettingData/01_03_componentsOfTidyData/index.md. Per its advice, a "study design" session is also included within the codebook along with the variable explanation and transformation. 

==Reference Documents==

Source of the original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Original description for the collected data at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

feature_info.txt(included in the original zip folder): explains how the original variables come from and made in that way.

README.txt(included in the original zip folder): describes the study design and how data is collected. 

Sample CodeBook referenced: 

1. https://gist.github.com/kirstenfrank/218c36a1938055d0f4e4

2. https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf

==Study Design==

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

The original dataset is utilized by the following publication: 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

==Data Dictionary==

X_train:Data measurements from subjects in the training population. Data is in 7352 rows, 561 columns. Columns are labeled V1..V561

X_test: Data measurements from subjects in the test population. Data is in 2947 rows, 561 columns. Columns are labeled V1..V561

feature: dataframe read from "feature.txt" file. It has 561 rows, 2 columns. Variables names are:

tBodyAcc-mean()-X
tBodyAcc-mean()-
tBodyAcc-mean()-Z
tBodyAcc-std()-X
tBodyAcc-std()-Y
tBodyAcc-std()-Z
tBodyAcc-mad()-X
tBodyAcc-mad()-Y
tBodyAcc-mad()-Z
tBodyAcc-max()-X
...
...

rawdata: the merged dataset for X-test and X_train. It has 10299 rows and 561 columns.

subject1: data frame read from subject_test.txt file that contains values for subjects in the testing population. It has 2947 rows, 1 column with values in a range of 1 to 30. 

subject2: data frame read from subject_train.txt filethat contains values for subjects in the training population. It has 7352 rows, 1 column with values in a range of 1 to 30. 

joint: the combined data frame from subject 1 and subject 2 with column name as "subject".

nact1: data frame read from y_test.txt file that contains activity codes for the testing population. It has 2947 rows and 1 column with values ranging from 1 to 6. 

nact2: data frame read from y_train.txt file that contains activity codes for the training population. It has 7352 rows and 1 column with values ranging from 1 to 6. 

activity: the combined data frame from nact1 and nact2 with column name as "activity". It has 10299 rows and 1 column with values substituted for descriptive names. The mapping is: "1=walking" , "2=walking_upstairs", "3=walking_downstairs","4=sitting","5=standing", "6=laying".

newdata:the merged data set with subject and descriptive activity columns together with other 561 feature columns. It has 10299 rows and 563 rows.

v_colnames: valid column names that is recognizable by R which excludes the duplicates and coerces signs to dots. 

good: a list of names that contains "mean" and "std" excluding "Mean"(see reason in README.md file).

good1: the unlisted version of good which is a character vector.

new: data set that has all the measurements on the mean and standard deviation together with subject and activity columns. It has 10299 rows and 81 columns, of which, 79 are from the means and standard deviation columns. 

new1: a vector generated after coercing the pattern "...X" to "_X" (e.g).

new2: a vector generator after coercing the pattern"std.." to "std" (e.g.). 

newf: a data set after grouped by subject and activity.

tidy_data: a data set derived from newf that contains the average of every variable for each activity and subject. It has 30*6 rows and 81 columns (subject and activity column with 79 columns from mean and standard deviation).



