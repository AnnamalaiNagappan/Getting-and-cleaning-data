## Codebook -- Getting and cleaning data ##
### Data folders, variables, calculations performed. ###


1. Data site               - [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

2. Data for use            - [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

3. UCI_HAR_Dataset         - Data folder
4. UCI_HAR_Dataset/train   - where train data sets are present
5. UCI_HAR_Dataset/test    - where test data sets are present

6. Read X_train.txt, y_train.txt, subject_train.txt into x_train_data, y_train_data,   train_subject.

7. Read X_test.txt, y_test.txt, subject_test.txt into x_test_data, y_test_data,   test_subject.

8. Concatenate x_train_data & y_train_data into join_x_data, y_train_data & y_test_data into  join_y_data, train_subject & test_subject into subject_data.

9. Read the features.txt into features and get only the measurements on the mean and standard deviation, which results in a 66 indices list. We get a subset of joinData with the 66 corresponding columns.

10. Clean the column names of the subset by removing the "()" and "-" symbols in the names, as well as make the first letter of "mean" and "std" a capital letter "M" and "S" respectively.

11. Read the activity_labels.txt into activity.

12. Clean the second column of activity by making it all lowercases, removing underscore and capitalize the letter immediately after inderscore. 

13. Transform the values of join_y_data according to the activity data frame.

14. Combine the subject_data, join_y_data and join_x_data by column to get a new cleaned 10299x68 data frame, cleanedData. Properly name the first two columns, "subject" and "activity". The "subject" column contains integers that range from 1 to 30 inclusive; the "activity" column contains 6 kinds of activity names; the last 66 columns contain measurements that range from -1 to 1 exclusive.

15. Write the clendata out to merged_data_set.txt file in current working directory.

16. Finally, generate a second independent tidy data set with the average of each measurement for each activity and each subject. We have 30 unique subjects and 6 unique activities, which result in a 180 combinations of the two. Then, for each combination, we calculate the mean of each measurement with the corresponding combination. So, after initializing the result data frame and performing the two for-loops, we get a 180x68 data frame.

17. Write the result out to tidy_data_set.txt file in current working directory. 


