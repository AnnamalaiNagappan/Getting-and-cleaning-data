### How run_analysis.R works ###

 1. Get the data from [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and I have renamed the folder  as UCI_HAR_Dataset , keep this folder in your working directory.
 2. Open R and type in the terminal the following command, source("run_analysis.R")
 3. After successful completion of the script, you will get two output files in the working directory
  1. File name             dimension  names
  2. merged_data_set.txt   10299*68  cleandata
  3. tidy_data_set.txt     180*68    result
 4. 6 activities in total and 30 subjects in total, we have 180 rows with all combinations for each of the 66 features
 5. Read tidy data set data <- read.table("tidy_data_set.txt") 
