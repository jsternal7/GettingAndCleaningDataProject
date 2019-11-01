Code Book - Accelerometer_Data_Combined

Note: For this project, one of the requirements was that all the mean and standard deviation variables for the accelerometer data were extracted for this final dataset. There was some debate regarding whether variables labeled as meanFreq() were considered means. For the purposes of this project, I have excluded meanFreq() as it is not a mean per se, but rather a weighted average of frequency components to obtain a mean frequency, and not a simple mathematical mean. Should you desire to incorporate the meanFreq() variables in replicating the dataset, this can be done by removing the grep statements in lines 24 and 39 of the associated R file ("run_analysis.R") as follows:

Origial: grep("mean\\()|std\\()", ...)
Modification: grep("mean|std", ...)

The removal of the \\() as a literal character in the search will include both mean() and meanFreq() as valid search hits in the subsetting of each dataset.

Variables:

1. Subject_ID 
    (Factor w/ 30 levels) - Subject ID for each participant, labeled 1 through 30.

2. Activity
    (Factor w/ 6 levels) - Designated activity that produced the subseqeunt measurements
      1 - WALKING
      2 - WALKING_UPSTAIRS
      3 - WALKING_DOWNSTAIRS
      4 - STANDING
      5 - SITTING
      6 - LAYING

3. tBodyAcc-mean()-X
    (num) - Time domain body accelerometer signal average - X-axis
  
4. tBodyAcc-mean()-Y
    (num) - Time domain body accelerometer signal average - Y-axis
  
5. tBodyAcc-mean()-Z
    (num) - Time domain body accelerometer signal average - Z-axis
  
6. tBodyAcc-std()-X
    (num) - Time domain body accelerometer signal standard deviation - X-axis
  
7. tBodyAcc-std()-Y
    (num) - Time domain body accelerometer signal standard deviation - Y-axis
  
8. tBodyAcc-std()-Z
    (num) - Time domain body accelerometer signal standard deviation - Z-axis
  
9. tGravityAcc-mean()-X
    (num) - Time domain gravity accelerometer signal average - X-axis
  
10. tGravityAcc-mean()-Y
    (num) - Time domain gravity accelerometer signal average - Y-axis
  
11. tGravityAcc-mean()-Z
    (num) - Time domain gravity accelerometer signal average - Z-axis
  
12. tGravityAcc-std()-X
    (num) - Time domain gravity accelerometer signal standard deviation - X-axis
  
13. tGravityAcc-std()-Y
    (num) - Time domain gravity accelerometer signal standard deviation - Y-axis
  
14. tGravityAcc-std()-Z
    (num) - Time domain gravity accelerometer signal standard deviation - Z-axis
  
15. tBodyAccJerk-mean()-X
    (num) - Time domain body accelerometer Jerk signal average - X-axis
  
16. tBodyAccJerk-mean()-Y
    (num) - Time domain body accelerometer Jerk signal average - Y-axis
  
17. tBodyAccJerk-mean()-Z
    (num) - Time domain body accelerometer Jerk signal average - Z-axis
  
18. tBodyAccJerk-std()-X
    (num) - Time domain body accelerometer Jerk signal standard deviation - X-axis
  
19. tBodyAccJerk-std()-Y
    (num) - Time domain body accelerometer Jerk signal standard deviation - Y-axis
  
20. tBodyAccJerk-std()-Z
    (num) - Time domain body accelerometer Jerk signal standard deviation - Z-axis
  
21. tBodyGyro-mean()-X
    (num) - Time domain body gyroscope signal average - X-axis
  
22. tBodGyro-mean()-Y
    (num) - Time domain body gyroscope signal average - Y-axis
  
23. tBodyGyro-mean()-Z
    (num) - Time domain body gyroscope signal average - Z-axis
  
24. tBodyGyro-std()-X
    (num) - Time domain body gyroscope signal standard deviation - X-axis
  
25. tBodyGyro-std()-Y
    (num) - Time domain body gyroscope signal standard deviation - Y-axis
  
26. tBodyGyro-std()-Z
    (num) - Time domain body gyroscope signal standard deviation - Z-axis

27. tBodyGyroJerk-mean()-X
    (num) - Time domain body gyroscope Jerk signal average - X-axis
  
28. tBodGyroJerk-mean()-Y
    (num) - Time domain body gyroscope Jerk signal average - Y-axis
  
29. tBodyGyroJerk-mean()-Z
    (num) - Time domain body gyroscope Jerk signal average - Z-axis
  
30. tBodyGyroJerk-std()-X
    (num) - Time domain body gyroscope Jerk signal standard deviation - X-axis
  
31. tBodyGyroJerk-std()-Y
    (num) - Time domain body gyroscope Jerk signal standard deviation - Y-axis
  
32. tBodyGyroJerk-std()-Z
    (num) - Time domain body gyroscope Jerk signal standard deviation - Z-axis
