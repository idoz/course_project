# input files:
# subject_{train,test}.csv
# x_{train,test}.csv
# y_{train,test}.csv

# output data frames
# data_1 - train and test are merged to one data set
# data_2 - a tidy data set


# indices of relevant features:
# (this list can be easily changed by reassigning relevant feature numbers in the variable feature_vec below)

# 1 tBodyAcc-mean()-X
# 2 tBodyAcc-mean()-Y
# 3 tBodyAcc-mean()-Z
# 4 tBodyAcc-std()-X
# 5 tBodyAcc-std()-Y
# 6 tBodyAcc-std()-Z
# 
# 121 tBodyGyro-mean()-X
# 122 tBodyGyro-mean()-Y
# 123 tBodyGyro-mean()-Z
# 124 tBodyGyro-std()-X
# 125 tBodyGyro-std()-Y
# 126 tBodyGyro-std()-Z
# 
# 266 fBodyAcc-mean()-X
# 267 fBodyAcc-mean()-Y
# 268 fBodyAcc-mean()-Z
# 269 fBodyAcc-std()-X
# 270 fBodyAcc-std()-Y
# 271 fBodyAcc-std()-Z

# 424 fBodyGyro-mean()-X
# 425 fBodyGyro-mean()-Y
# 426 fBodyGyro-mean()-Z
# 427 fBodyGyro-std()-X
# 428 fBodyGyro-std()-Y
# 429 fBodyGyro-std()-Z

# activity labels
# 1 WALKING
# 2 WALKING_UPSTAIRS
# 3 WALKING_DOWNSTAIRS
# 4 SITTING
# 5 STANDING
# 6 LAYING


# read subjects
subject_train = read.table("train/subject_train.txt")
subject_test = read.table("test/subject_test.txt")
# read labels
label_train = read.table("train/y_train.txt")
label_test = read.table("test/y_test.txt")
# read features
feature_train = read.table("train/x_train.txt")
feature_test = read.table("test/x_test.txt")
# extract relevant features
feature_vec = c(1:6,121:126,266:271,424:429)
feature_train = feature_train[,feature_vec]
feature_test = feature_test[,feature_vec]

# merge
subjects = rbind(subject_train,subject_test)
labels = rbind(label_train,label_test)
features = rbind(feature_train,feature_test)
data = cbind(subjects,labels,features)

# change names
names = colnames(data)
names[1] = "subject"
names[2] = "activity"
colnames(data) = names

# change activity code to label
data_1 = data
data_1$activity = factor(data_1$activity,levels=c(1:6),labels=c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING"))

# create tidy data
library(reshape2)
data_m = melt(data,id=names[c(1,2)],measure.vars=names[c(3:length(names))])
data_2 = dcast(data_m,subject + activity ~ variable,mean)
data_2$activity = factor(data_2$activity,levels=c(1:6),labels=c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING"))

