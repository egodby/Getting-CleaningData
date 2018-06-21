# **Assignment Description**
## Project Background


>Data Set Information:

>The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone(Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

>The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.


>Attribute Information:

>For each record in the dataset it is provided: 
>- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
>- Triaxial Angular velocity from the gyroscope. 
>- A 561-feature vector with time and frequency domain variables. 
>- Its activity label. 
>- An identifier of the subject who carried out the experiment.

Reference Link:[Full Description](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## This repo files includ:
1. Codebook
    1. Explain the transformation from raw data
    2. Variable Explaination
    3. Marker Notice
2. run_analysis.R 
    1. The assignment code that can download data set zip file from the given url link.
    2. Create entire data set including all mean & standard diviation variables.
    3. Create second tidy data that is grouped by Volunteer number, Descriptive activity & SetType. 
       All variables are set with average as to the first data set.
    4. Second tidy data is saved as "Tidy_data.txt"
 3. Tidy_data.txt
    Created by run_analysis.R
 
 ## Version
 This code is based on R version 3.5.0, dplyr package version 0.7.5
