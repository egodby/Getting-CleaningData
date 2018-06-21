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
# ** Variable Notation**
