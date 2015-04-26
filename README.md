## Getting and Cleaning Data - Project

The purpose of this project is to create a cleaned-up, tidy data set that can be
used for further analysis. A full description of the data can be found at
[UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)


[The source dataset is located here for download](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

## How the run_analysis.R Script Works (Script Overview)
 
 * Loads raw data from directory into R
 * Merges the training and the test sets to create one data set
 * Modifies data set to include only mean and standard deviations for each of the study's measured variables
 * Uses descriptive activity names to name the activities in the data set
 * "Cleans up" the messy labels on the data set with descriptive activity names
 * Creates a final data set of the results 
 * Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Modifications
*  Please note, you will need to make one modification to the script. Namely,
in line 4 of 'Run_analysis.R', you will have to set the working directory to the location of your downloaded source folder. 

## Other Notes

*  Only variables containing mean() & std() are used in final tidy data set.
*  Requires the plyr package.

Constructed using the following:

```R
> version
platform       x86_64-apple-darwin13.4.0   
arch           x86_64                      
os             darwin13.4.0                
system         x86_64, darwin13.4.0        
status                                     
major          3                           
minor          1.2                         
year           2014                        
month          10                          
day            31                          
svn rev        66913                       
language       R                           
version.string R version 3.1.2 (2014-10-31)
nickname       Pumpkin Helmet              
```

##  Running

```bash
$ Rscript run_analysis.R
```

Yields tidy.txt & tidy.mean.txt.