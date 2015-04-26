# Getting and Cleaning Data Course Project
Kurt Schuepfer

## 1) Codebook overview
This codebook contains information about the study design, the variables measured, and the types of transformations performed on those variables, as commanded by the data cleaning script ('run_analysis.R'). 

### Source Data
Source data is from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

A full description of the data can be found at
[UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

### Study Design and Dataset Information
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

A video of the experiment including an example of the 6 recorded activities with one of the participants can be seen in the following link: [http://www.youtube.com/watch?v=XOEN9W05_4A](http://www.youtube.com/watch?v=XOEN9W05_4A)

### Attribute Information:

For each record in the dataset it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A 561-feature vector with time and frequency domain variables.
- Its activity label.
- An identifier of the subject who carried out the experiment. 

### Attribute Selection
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

### Attribute Details
The set of variables that were estimated were: 

*  mean(): Mean value
*  std(): Standard deviation
*  mad(): Median absolute deviation 
*  max(): Largest value in array
*  min(): Smallest value in array
*  sma(): Signal magnitude area
*  energy(): Energy measure. Sum of the squares divided by the number of values. 
*  iqr(): Interquartile range 
*  entropy(): Signal entropy
*  arCoeff(): Autoregression coefficients with Burg order equal to 4
*  correlation(): Correlation coefficient between two signals
*  maxInds(): Index of the frequency component with largest magnitude
*  meanFreq(): Weighted average of the frequency components to obtain a mean frequency
*  skewness(): Skewness of the frequency domain signal 
*  kurtosis(): Kurtosis of the frequency domain signal 
*  bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT
   of each window.
*  angle(): Angle between some vectors.

No unit of measures is reported as all features were normalized and bounded
within [-1,1].


## 2) Output of 'run_analysis.R' Script

### Tidy Mean

A data.table named `tidy_mean` is set with the following columns.  All units are maintained from the original data set. A file named tidy_mean.txt is written from run_analysis.R.

| column       | description                                              | type    |
| ------------ | -------------------------------------------------------- | ------- |
| Subject      | Identifier of the subject                                | integer |
| Activity     | Label of the activity                                    | factor  |
| MeanSamples  | Mean of variables by Subject + Activity provided in 'tidy' | numeric |

### Tidy

A data.table named `step3b` is set with the following "cleaned up" or transformed column names. All units are maintained from the original data set. A file named tidy.txt is written from run_analysis.R.

|    | Transformed variable name            | Original variable name               |
|----|--------------------------------------|--------------------------------------|
| 1  | timeBodyAccMean-X                    | tBodyAcc-mean()-X                    |
| 2  | timeBodyAccMean-Y                    | tBodyAcc-mean()-Y                    |
| 3  | timeBodyAccMean-Z                    | tBodyAcc-mean()-Z                    |
| 4  | timeGravityAccMean-X                 | tGravityAcc-mean()-X                 |
| 5  | timeGravityAccMean-Y                 | tGravityAcc-mean()-Y                 |
| 6  | timeGravityAccMean-Z                 | tGravityAcc-mean()-Z                 |
| 7  | timeBodyAccJerkMean-X                | tBodyAccJerk-mean()-X                |
| 8  | timeBodyAccJerkMean-Y                | tBodyAccJerk-mean()-Y                |
| 9  | timeBodyAccJerkMean-Z                | tBodyAccJerk-mean()-Z                |
| 10 | timeBodyGyroMean-X                   | tBodyGyro-mean()-X                   |
| 11 | timeBodyGyroMean-Y                   | tBodyGyro-mean()-Y                   |
| 12 | timeBodyGyroMean-Z                   | tBodyGyro-mean()-Z                   |
| 13 | timeBodyGyroJerkMean-X               | tBodyGyroJerk-mean()-X               |
| 14 | timeBodyGyroJerkMean-Y               | tBodyGyroJerk-mean()-Y               |
| 15 | timeBodyGyroJerkMean-Z               | tBodyGyroJerk-mean()-Z               |
| 16 | timeBodyAccMagnitudeMean             | tBodyAccMag-mean()                   |
| 17 | timeGravityAccMagnitudeMean          | tGravityAccMag-mean()                |
| 18 | timeBodyAccJerkMagnitudeMean         | tBodyAccJerkMag-mean()               |
| 19 | timeBodyGyroMagnitudeMean            | tBodyGyroMag-mean()                  |
| 20 | timeBodyGyroJerkMagnitudeMean        | tBodyGyroJerkMag-mean()              |
| 21 | freqBodyAccMean-X                    | fBodyAcc-mean()-X                    |
| 22 | freqBodyAccMean-Y                    | fBodyAcc-mean()-Y                    |
| 23 | freqBodyAccMean-Z                    | fBodyAcc-mean()-Z                    |
| 24 | freqBodyAccMeanFreq-X                | fBodyAcc-meanFreq()-X                |
| 25 | freqBodyAccMeanFreq-Y                | fBodyAcc-meanFreq()-Y                |
| 26 | freqBodyAccMeanFreq-Z                | fBodyAcc-meanFreq()-Z                |
| 27 | freqBodyAccJerkMean-X                | fBodyAccJerk-mean()-X                |
| 28 | freqBodyAccJerkMean-Y                | fBodyAccJerk-mean()-Y                |
| 29 | freqBodyAccJerkMean-Z                | fBodyAccJerk-mean()-Z                |
| 30 | freqBodyAccJerkMeanFreq-X            | fBodyAccJerk-meanFreq()-X            |
| 31 | freqBodyAccJerkMeanFreq-Y            | fBodyAccJerk-meanFreq()-Y            |
| 32 | freqBodyAccJerkMeanFreq-Z            | fBodyAccJerk-meanFreq()-Z            |
| 33 | freqBodyGyroMean-X                   | fBodyGyro-mean()-X                   |
| 34 | freqBodyGyroMean-Y                   | fBodyGyro-mean()-Y                   |
| 35 | freqBodyGyroMean-Z                   | fBodyGyro-mean()-Z                   |
| 36 | freqBodyGyroMeanFreq-X               | fBodyGyro-meanFreq()-X               |
| 37 | freqBodyGyroMeanFreq-Y               | fBodyGyro-meanFreq()-Y               |
| 38 | freqBodyGyroMeanFreq-Z               | fBodyGyro-meanFreq()-Z               |
| 39 | freqBodyAccMagnitudeMean             | fBodyAccMag-mean()                   |
| 40 | freqBodyAccMagnitudeMeanFreq         | fBodyAccMag-meanFreq()               |
| 41 | freqBodyAccJerkMagnitudeMean         | fBodyBodyAccJerkMag-mean()           |
| 42 | freqBodyAccJerkMagnitudeMeanFreq     | fBodyBodyAccJerkMag-meanFreq()       |
| 43 | freqBodyGyroMagnitudeMean            | fBodyBodyGyroMag-mean()              |
| 44 | freqBodyGyroMagnitudeMeanFreq        | fBodyBodyGyroMag-meanFreq()          |
| 45 | freqBodyGyroJerkMagnitudeMean        | fBodyBodyGyroJerkMag-mean()          |
| 46 | freqBodyGyroJerkMagnitudeMeanFreq    | fBodyBodyGyroJerkMag-meanFreq()      |
| 47 | angle(tBodyAccMean,Gravity)          | angle(tBodyAccMean,gravity)          |
| 48 | angle(tBodyAccJerkMean),GravityMean) | angle(tBodyAccJerkMean),gravityMean) |
| 49 | angle(tBodyGyroMean,GravityMean)     | angle(tBodyGyroMean,gravityMean)     |
| 50 | angle(tBodyGyroJerkMean,GravityMean) | angle(tBodyGyroJerkMean,gravityMean) |
| 51 | angle(X,GravityMean)                 | angle(X,gravityMean)                 |
| 52 | angle(Y,GravityMean)                 | angle(Y,gravityMean)                 |
| 53 | angle(Z,GravityMean)                 | angle(Z,gravityMean)                 |
| 54 | timeBodyAcc-std-X                    | tBodyAcc-std()-X                     |
| 55 | timeBodyAcc-std-Y                    | tBodyAcc-std()-Y                     |
| 56 | timeBodyAcc-std-Z                    | tBodyAcc-std()-Z                     |
| 57 | timeGravityAcc-std-X                 | tGravityAcc-std()-X                  |
| 58 | timeGravityAcc-std-Y                 | tGravityAcc-std()-Y                  |
| 59 | timeGravityAcc-std-Z                 | tGravityAcc-std()-Z                  |
| 60 | timeBodyAccJerk-std-X                | tBodyAccJerk-std()-X                 |
| 61 | timeBodyAccJerk-std-Y                | tBodyAccJerk-std()-Y                 |
| 62 | timeBodyAccJerk-std-Z                | tBodyAccJerk-std()-Z                 |
| 63 | timeBodyGyro-std-X                   | tBodyGyro-std()-X                    |
| 64 | timeBodyGyro-std-Y                   | tBodyGyro-std()-Y                    |
| 65 | timeBodyGyro-std-Z                   | tBodyGyro-std()-Z                    |
| 66 | timeBodyGyroJerk-std-X               | tBodyGyroJerk-std()-X                |
| 67 | timeBodyGyroJerk-std-Y               | tBodyGyroJerk-std()-Y                |
| 68 | timeBodyGyroJerk-std-Z               | tBodyGyroJerk-std()-Z                |
| 69 | timeBodyAccMagnitudeStdDev           | tBodyAccMag-std()                    |
| 70 | timeGravityAccMagnitudeStdDev        | tGravityAccMag-std()                 |
| 71 | timeBodyAccJerkMagnitudeStdDev       | tBodyAccJerkMag-std()                |
| 72 | timeBodyGyroMagnitudeStdDev          | tBodyGyroMag-std()                   |
| 73 | timeBodyGyroJerkMagnitudeStdDev      | tBodyGyroJerkMag-std()               |
| 74 | freqBodyAcc-std-X                    | fBodyAcc-std()-X                     |
| 75 | freqBodyAcc-std-Y                    | fBodyAcc-std()-Y                     |
| 76 | freqBodyAcc-std-Z                    | fBodyAcc-std()-Z                     |
| 77 | freqBodyAccJerk-std-X                | fBodyAccJerk-std()-X                 |
| 78 | freqBodyAccJerk-std-Y                | fBodyAccJerk-std()-Y                 |
| 79 | freqBodyAccJerk-std-Z                | fBodyAccJerk-std()-Z                 |
| 80 | freqBodyGyro-std-X                   | fBodyGyro-std()-X                    |
| 81 | freqBodyGyro-std-Y                   | fBodyGyro-std()-Y                    |
| 82 | freqBodyGyro-std-Z                   | fBodyGyro-std()-Z                    |
| 83 | freqBodyAccMagnitudeStdDev           | fBodyAccMag-std()                    |
| 84 | freqBodyAccJerkMagnitudeStdDev       | fBodyBodyAccJerkMag-std()            |
| 85 | freqBodyGyroMagnitudeStdDev          | fBodyBodyGyroMag-std()               |
| 86 | freqBodyGyroJerkMagnitudeStdDev      | fBodyBodyGyroJerkMag-std()           |


### Final Notes

Check the [README.md](README.md) file for further details about the script.