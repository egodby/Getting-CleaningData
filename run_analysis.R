library(dplyr)

###################################################
##   Get Data

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
file <- "UCI HAR Dataset.zip"

##  download zip file if doesn't exist in current directory

if (!file.exists(file)) {
  download.file(url, file, mode = "wb")
}

##  Unzip data if doesn't unzip in current directory

dir="~/UCI HAR Dataset"
if (!file.exists(dir)) {
  unzip(file)
}
###################################################
##  Load Test and Train data

featureLables<-read.table(paste(dir,"features.txt",sep="/"))
ActivityLabels<-read.table(paste(dir,"activity_labels.txt",sep="/"))
TestVolunteers<-read.table(paste(dir,"test/subject_test.txt",sep="/"))
EstimateActivity<-read.table(paste(dir,"test/y_test.txt",sep="/"))
TestData<-read.table(paste(dir,"test/X_test.txt",sep="/"))


TrainVolunteers<-read.table(paste(dir,"train/subject_train.txt",sep="/"))
TrainActivity<-read.table(paste(dir,"train/y_train.txt",sep="/"))
TrainData<-read.table(paste(dir,"train/X_train.txt",sep="/"))

###################################################
## Combine Test set & Train Set
## Add a new column identify set type

ds<-rbind(mutate(TestData,SetType="Test"),mutate(TrainData,SetType="Train"))

## Adding subjects & Activity Sets

ds<-cbind(ds,rbind(TestVolunteers,TrainVolunteers),
          rbind(EstimateActivity,TrainActivity))
colnames(ds)<-c(as.character(featureLables[[2]]),
                "SetType","Volunteer","Activity")

## Check Unique Name for later munipulation
ds<-ds%>%
  setNames(make.names(names(.), unique = TRUE))

## Subtract Mean & Standard diviation data 

colnames(ds)<-gsub("mean","Mean",colnames(ds))
colnames(ds)<-gsub("std","StandDev",colnames(ds))
ds<-ds[,grepl("Mean|StandDev|SetType|Volunteer|Activity",colnames(ds))]
ds<-ds[,!grepl("MeanFreq",colnames(ds))]
ds<-ds[,!grepl("angle",colnames(ds))]
## Relate Activiy detail with data set
ds$Activity<-sapply(ds$Activity,function(x) ActivityLabels[[x,2]])

## Remove redundant data

rm(list=setdiff(ls(), "ds"))
###################################################
## Column Name Munipulation for better read

DesireNames<-colnames(ds)
DesireNames<-gsub("\\.","",DesireNames)
DesireNames<-gsub("gravity","Gravity",DesireNames)
DesireNames<-gsub("BodyBody","Body",DesireNames)
DesireNames<-gsub("Freq","",DesireNames)
DesireNames<-gsub("^t","TimeDomain",DesireNames)
DesireNames<-gsub("^f","FreqDomain",DesireNames)


colnames(ds)<-DesireNames
###################################################
##  Create second Tidy Data grouped by Subjects, Activity detail and SetType
##  Calculate Average for each variables & Save in txt file
Tidydata<-ds%>% group_by(Volunteer,Activity,SetType) %>% 
  summarise_each(funs(mean))
write.table(Tidydata,"Tidy_Data.txt",sep="\t",row.names = FALSE, quote = FALSE)

