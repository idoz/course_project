Processing of UCI HAR Data set:

run_analysis.R:
loads the 6 relevant tables, 3 of train sets and 3 of test sets.
Each triplet is first column-bind (subject,activity, measurements)
Then the two sets are row-bind to data_1

Only mean and std measurements are extracted, these are the measurements with the numbers 1:6,121:126,266:271,424:429
The text of these measurements is given below

Column names of the data sets are "subject", "activity", then the measurements numbers

A tidy data set, data_2, is extracted from data_1 using the melt and dcast function that require to load library(reshape2)

The output data sets are given in variables data_1 and data_2

The uploaded tidy data set should be read with: tidy = read.csv("tidy.txt")

Extracted measurements - for the purposes of this analysis, the mean/std variables were defined as the following:
1 tBodyAcc-mean()-X
2 tBodyAcc-mean()-Y
3 tBodyAcc-mean()-Z
4 tBodyAcc-std()-X
5 tBodyAcc-std()-Y
6 tBodyAcc-std()-Z

121 tBodyGyro-mean()-X
122 tBodyGyro-mean()-Y
123 tBodyGyro-mean()-Z
124 tBodyGyro-std()-X
125 tBodyGyro-std()-Y
126 tBodyGyro-std()-Z

266 fBodyAcc-mean()-X
267 fBodyAcc-mean()-Y
268 fBodyAcc-mean()-Z
269 fBodyAcc-std()-X
270 fBodyAcc-std()-Y
271 fBodyAcc-std()-Z

424 fBodyGyro-mean()-X
425 fBodyGyro-mean()-Y
426 fBodyGyro-mean()-Z
427 fBodyGyro-std()-X
428 fBodyGyro-std()-Y
429 fBodyGyro-std()-Z