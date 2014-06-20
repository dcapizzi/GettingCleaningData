Data Dictionary - Getting & Cleaning Data project - dcapizzi

Original data obtained from the Human Activity Recognition Using Smartphones Data Set. Full information can be found at the link provided below. 

Source Data: Human Activity Recognition Using Smartphones Data Set 

Abstract: Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

The experiments were carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

Original data set provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

Variables: tBodyAcc-XYZ, tGravityAcc-XYZ,tBodyAccJerk-XYZ, tBodyGyro-XYZ, tBodyGyroJerk-XYZ, tBodyAccMag, tGravityAccMag, tBodyAccJerkMag tBodyGyroMag, tBodyGyroJerkMag, fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccMag, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag

Calculations on each variable:
mean(): Mean value
std(): Standard deviation
(add.) See source data set for details

Link to Source Data: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
Date Downloaded: Fri Jun 20 18:12:47 2014

Transformations:
Source data was downloaded, multiple source files (test, training data) were merged using the R "merge" command. Activity descriptions and column names were appended to the merged data file. Variable data set was reduced to ONLY measurements specifically addressing the "mean" or "variance" - specifically those with "mean()" or "variance()" in the heading. Headings were simplified to be more readable. Used R "reshape3" library melt command calculate the average value of each measurement for each subject / activity pairing.

See README file for additional details.

Variables in tidydata.csv data set:

subject: Numeric variable documenting the subject of the experiment (1 to 30)
activity: String variable describing the type of activity: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

The following variables represent the mean value of each variable provided by the source data across each activity / subject pairing. Each variable represents the original measure (tbodyacc, tgravityacc, etc.), the calculation (mean or standard deviation), and the axis (x, y, z).

* tbodyacc.mean.x
* tbodyacc.mean.y
* tbodyacc.mean.z
* tgravityacc.mean.x
* tgravityacc.mean.y
* tgravityacc.mean.z
* tbodyaccjerk.mean.x
* tbodyaccjerk.mean.y
* tbodyaccjerk.mean.z
* tbodygyro.mean.x
* tbodygyro.mean.y
* tbodygyro.mean.z
* tbodygyrojerk.mean.x
* tbodygyrojerk.mean.y
* tbodygyrojerk.mean.z
* tbodyaccmag.mean
* tgravityaccmag.mean
* tbodyaccjerkmag.mean
* tbodygyromag.mean
* tbodygyrojerkmag.mean
* fbodyacc.mean.x
* fbodyacc.mean.y
* fbodyacc.mean.z
* fbodyaccjerk.mean.x
* fbodyaccjerk.mean.y
* fbodyaccjerk.mean.z
* fbodygyro.mean.x
* fbodygyro.mean.y
* fbodygyro.mean.z
* fbodyaccmag.mean
* fbodybodyaccjerkmag.mean
* fbodybodygyromag.mean
* fbodybodygyrojerkmag.mean
* tbodyacc.std.x
* tbodyacc.std.y
* tbodyacc.std.z
* tgravityacc.std.x
* tgravityacc.std.y
* tgravityacc.std.z
* tbodyaccjerk.std.x
* tbodyaccjerk.std.y
* tbodyaccjerk.std.z
* tbodygyro.std.x
* tbodygyro.std.y
* tbodygyro.std.z
* tbodygyrojerk.std.x
* tbodygyrojerk.std.y
* tbodygyrojerk.std.z
* tbodyaccmag.std
* tgravityaccmag.std
* tbodyaccjerkmag.std
* tbodygyromag.std
* tbodygyrojerkmag.std
* fbodyacc.std.x
* fbodyacc.std.y
* fbodyacc.std.z
* fbodyaccjerk.std.x
* fbodyaccjerk.std.y
* fbodyaccjerk.std.z
* fbodygyro.std.x
* fbodygyro.std.y
* fbodygyro.std.z
* fbodyaccmag.std
* fbodybodyaccjerkmag.std
* fbodybodygyromag.std
* fbodybodygyrojerkmag.std 