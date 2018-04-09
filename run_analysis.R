library(dplyr)

# download the files
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url,"data.zip")
unzip("data.zip")
file.remove("data.zip")
  
# open all the needed data
train <- read.table("UCI HAR Dataset/train/X_train.txt")
test <- read.table("UCI HAR Dataset/test/X_test.txt")
subject.train <- read.table("UCI HAR Dataset/train/subject_train.txt")
subject.test <- read.table("UCI HAR Dataset/test/subject_test.txt")
y.train<- read.table("UCI HAR Dataset/train/y_train.txt")
y.test<- read.table("UCI HAR Dataset/test/y_test.txt")
features <- read.table("UCI HAR Dataset/features.txt")
activity.labels <-  read.table("UCI HAR Dataset/activity_labels.txt")


#add the column names, subject number & actvity number columns to the training data set
names(train)<-features[,2]
train$subject<-subject.train[,1]
train$activitynumber<-y.train[,1]

#add the column names, subject number & actvity number columns to the test data set
names(test)<-features[,2]
test$subject<-subject.test[,1]
test$activitynumber<-y.test[,1]

#Merge the trainin & test sets
total<-rbind(train,test)

#Extract only the measurements on the mean and standard deviation for each measurement. Assume here we don't want meanFreq().
total<- total[,grep("mean\\(\\)|std\\(\\)|activityname|subject",names(total))]

#add useful column names to the activity labels data
names(activity.labels)<- c("activitynumber","activityname")
activity.labels <- activity.labels %>% mutate(activityname=gsub("_","",tolower(activityname)))

#Use descriptive activity names to name the activities in the data set by merging with activity.labels. 
#Note sort=FALSE is neccesary to preserve ordering!
total<-merge(total,activity.labels,sort=FALSE) %>% select(-activitynumber)

#Appropriately labels the data set with descriptive variable names. To further undertsand tags used please refer to CodeBook. 
n<- names(total)
n<-gsub("BodyBody","body",n)
n<-gsub("^f","freq",n)
n<-gsub("^t","time",n)
n<-gsub("-","",n)
n<- tolower(n)
n<-gsub("mean\\(\\)","mean",n)
n<-gsub("std\\(\\)","std",n)
names(total)<- n

#Creates a second, independent tidy data set with the average of each variable for each activity and each subject
tidydata<- group_by(total,activityname,subject) %>% summarize_all(mean)

#Writes the final, tidy dataset out to txt file without rownames. 
write.table(tidy,file="tidydata.txt",row.name=FALSE)

#You can uncomment this code to read in & view the saved dataset. 
#data <- read.table("tidydata.txt", header = TRUE)
#View(data)





