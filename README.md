# GC_Data-CourseProject
## Course Project
This is a repository describing how the script of the Course Project works.
* Unzip the source (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) into a folder on the local drive, for example C:\Utilisateurs\Users\yourname\Documents\R\

* Copy run_analysis.R into C:\Utilisateurs\Users\yourname\Documents\getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset\

* Change de woring directorate by writting in R: setwd("C:\\Utilisateurs\Users\\yourname\\Documents\\R\\getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset\\"), followed by: source("run_analysis.R")

* Use data <- read.table("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/data_set_with_averages.txt") to read the data. It is 180x68 because there are 30 subjects and 6 activities, thus "for each activity and each subject" means 30 * 6 = 180 rows. Note that the provided R script has no assumptions on numbers of records, only on locations of files.



