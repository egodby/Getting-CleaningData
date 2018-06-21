This is the codebook for R code run_analysis.R.
The code will generate two codes:
1.  All variables included tidy code (variables will be explained later).
2.  Tidy code grouped by Volunteer, Activity, SetType, other variables will set with mean value respect to step 1 data.
# **Data Transformation**
1. Data Set 1
	1.	The test data set and train data set are combined with variable lable "SetType" to identify different category
    2.	Subject and Activity are then merge to the data set with label "Volunteer" and "Activity" respectively. (One may say 		that the activity in train data set is considered as known and the activity in the test data set is estimated).
    3.	Activity is are visualized and replaced with descriptive activity label.
    4.	Select only mean and standard deviation observations.
    5.	Proper and clearer names are assigned to all the variables as column name. 
   
2. Data Set 2
	1.	Group data set 1 as Volunteer, Activity, SetType
  	2.	Calculate the rest variables mean value
  	3.	Output data set 2
# **Variable Notation**
>The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

>Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

>Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).
## Variable List
-	`Volunteer` is volunteers for this experiment, or called "Subject". It's range from 1 to 30.
-	`Activity` is the descriptive activity known or estimated and is listed as WALKING,WALKING_UPSTAIRS,WALKING_DOWNSTAIRS,SITTING,STANDING,LAYING
-	`SetType` is the observation type based on either it is "Test" or "Train". It will benefit markers to observe the accuracy of the data.
-	`”TimeDomainBodyAccMeanX”`
-	`”TimeDomainBodyAccMeanY”`
-	`”TimeDomainBodyAccMeanZ”`
	-	is the mean value of the body acceleration signal of 3-Axial in time domain
-	`”TimeDomainBodyAccStandDevX”`
-	`”TimeDomainBodyAccStandDevY”`
-	`”TimeDomainBodyAccStandDevZ”`
	-	is the standard deviation of the body acceleration signal of 3-Axial in time domain
-	`”TimeDomainGravityAccMeanX”`
-	`”TimeDomainGravityAccMeanY”`
-	`”TimeDomainGravityAccMeanZ”`
	-	is the mean value of the gravity acceleration signal of 3-Axial in time domain
-	`”TimeDomainGravityAccStandDevX”`
-	`”TimeDomainGravityAccStandDevY”`
-	`”TimeDomainGravityAccStandDevZ”`
	-	is the standard deviation of the body acceleration signal of 3-Axial in time domain
-	`”TimeDomainBodyAccJerkMeanX”`
-	`”TimeDomainBodyAccJerkMeanY”`
-	`”TimeDomainBodyAccJerkMeanZ”`
	-	is the mean value of the body acceleration Jerk signal of 3-Axial in time domain
-	`”TimeDomainBodyAccJerkStandDevX”`
-	`”TimeDomainBodyAccJerkStandDevY”`
-	`”TimeDomainBodyAccJerkStandDevZ”`
	-	is the standard deviation of the body acceleration Jerk signal of 3-Axial in time domain
-	`”TimeDomainBodyGyroMeanX”`
-	`”TimeDomainBodyGyroMeanY”`
-	`”TimeDomainBodyGyroMeanZ”`
	-	is the mean value of the body gyroscope signal of 3-Axial in time domain
-	`”TimeDomainBodyGyroStandDevX”`
-	`”TimeDomainBodyGyroStandDevY”`
-	`”TimeDomainBodyGyroStandDevZ”`
	-	is the standard deviation of the body gyroscope signal of 3-Axial in time domain
-	`”TimeDomainBodyGyroJerkMeanX”`
-	`”TimeDomainBodyGyroJerkMeanY”`
-	`”TimeDomainBodyGyroJerkMeanZ”`
	-	is the mean value of the body gyroscope Jerk signal of 3-Axial in time domain
-	`”TimeDomainBodyGyroJerkStandDevX”`
-	`”TimeDomainBodyGyroJerkStandDevY”`
-	`”TimeDomainBodyGyroJerkStandDevZ”`
	-	is the standard deviation of the body gyroscope Jerk signal of 3-Axial in time domain
-	`”TimeDomainBodyAccMagMean”` is the mean value of the body acceleration signal magnitude in time domain
-	`”TimeDomainBodyAccMagStandDev”` is the standard deviation of the body acceleration signal magnitude in time domain
-	`”TimeDomainGravityAccMagMean”` is the mean value of the gravity acceleration signal magnitude in time domain
-	`”TimeDomainGravityAccMagStandDev”` is the standard deviation of the gravity acceleration signal magnitude in time domain
-	`”TimeDomainBodyAccJerkMagMean”` is the mean value of the body acceleration Jerk signal magnitude in time domain
-	`”TimeDomainBodyAccJerkMagStandDev”` is the standard deviation of the body acceleration Jerk signal magnitude in time domain
-	`”TimeDomainBodyGyroMagMean”` is the mean value of the body gyroscope signal magnitude in time domain
-	`”TimeDomainBodyGyroMagStandDev”` is the standard deviation of the body gyroscope signal magnitude in time domain
-	`”TimeDomainBodyGyroJerkMagMean”` is the mean value of the body gyroscope Jerk signal magnitude in time domain
-	`”TimeDomainBodyGyroJerkMagStandDev”` is the standard deviation of the body gyroscope Jerk signal magnitude in time domain
-	`”FreqDomainBodyAccMeanX”`
-	`”FreqDomainBodyAccMeanY”`
-	`”FreqDomainBodyAccMeanZ”`
	-	is the mean value of the body acceleration signal of 3-Axial in frequency domain
-	`”FreqDomainBodyAccStandDevX”`
-	`”FreqDomainBodyAccStandDevY”`
-	`”FreqDomainBodyAccStandDevZ”`
	-	is the standard deviation of the body acceleration signal of 3-Axial in frequency domain
-	`”FreqDomainBodyAccJerkMeanX”`
-	`”FreqDomainBodyAccJerkMeanY”`
-	`”FreqDomainBodyAccJerkMeanZ”`
	-	is the mean value of the body acceleration Jerk signal of 3-Axial in frequency domain
-	`”FreqDomainBodyAccJerkStandDevX”`
-	`”FreqDomainBodyAccJerkStandDevY”`
-	`”FreqDomainBodyAccJerkStandDevZ”`
	-	is the standard deviation of the body acceleration Jerk signal of 3-Axial in frequency domain
-	`”FreqDomainBodyGyroMeanX”`
-	`”FreqDomainBodyGyroMeanY”`
-	`”FreqDomainBodyGyroMeanZ”`
	-	is the mean value of the body gyroscope signal of 3-Axial in frequency domain
-	`”FreqDomainBodyGyroStandDevX”`
-	`”FreqDomainBodyGyroStandDevY”`
-	`”FreqDomainBodyGyroStandDevZ”`
	-	is the standard deviation of the body gyroscope signal of 3-Axial in frequency domain
-	`”FreqDomainBodyAccMagMean”` is the mean value of the body acceleration signal in frequency domain
-	`”FreqDomainBodyAccMagStandDev”` is the standard deviation of the body acceleration signal in frequency domain
-	`”FreqDomainBodyAccJerkMagMean”` is the mean value of the body acceleration Jerk signal in frequency domain
-	`”FreqDomainBodyAccJerkMagStandDev”` is the standard deviation of the body acceleration Jerk signal in frequency domain
-	`”FreqDomainBodyGyroMagMean”` is the mean value of the body gyroscope signal magnitude in frequency domain
-	`”FreqDomainBodyGyroMagStandDev”` is the standard deviation of the body gyroscope signal magnitude in frequency domain
-	`”FreqDomainBodyGyroJerkMagMean”` is the mean value of the body gyroscope Jerk signal magnitude in frequency domain
-	`”FreqDomainBodyGyroJerkMagStandDev"` is the standard deviation of the body gyroscope Jerk signal magnitude in frequency domain

## Marker Notice
>Notes: 
======
>- Features are normalized and bounded within [-1,1].
>- Each feature vector is a row on the text file.

>For more information about this dataset contact: activityrecognition@smartlab.ws

>License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

>[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

>This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

>Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
