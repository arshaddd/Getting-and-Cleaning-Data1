       library(dplyr)   # loading required Packages

     # Downloading the DataSet
      
       FinalData <- "Coursera_DS3_Final.zip"
     
     # Checking if file already exists
       
       if(!file.exists(FinalFata))  {
              fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
              download.file(fileURL, FinalData, method = "curl")
              }

     # checking if folder exists
       
      if(!file.exists("UCI HAR Dataset"))  {
             unzip(FinalData)
}

       
       # Step 1  Merges the Training and test seyt to create the one data set.

X <- rbind(x_train, x_test)
Y <- rbind(y_train, y_test)
     Subject <- rbind(subject_train, subject_test)
     Merged_Data <- cbind(Subject, Y, X)

       #Step 2: Extracts only the measurements on the Mean n SD for each Measurement.


TidyData <- Merged_Data %>% select(subject, code, contains("mean"), contains("std"))

       #step3: Uses Descripitive activity Names to Name the activities in the data set.

TidyData$code <- activities[TidyData$code, 2]

       #step4: Appropriately lebels the data set with descripitive veriable names.

names(TidyData)[2] = "activity"
names(TidyData) <- gsub("Acc", "Accelerometer", names(TidyData))
names(TidyData) <- gsub("Gyro", "Gyroscope", names(TidyData))
names(TidyData) <- gsub("BodyBody", "Body", names(TidyData))
names(TidyData) <- gsub("Mag", "Magnitude", names(TidyData))
names(TidyData) <- gsub("^t", "Time", names(TidyData))
names(TidyData) <- gsub("^f", "Frequency", names(TidyData))
names(TidyData) <- gsub("tBody", "TimeBody", names(TidyData))
names(TidyData) <- gsub("-mean()", "Mean", names(TidyData), ignore.case = TRUE)
names(TidyData) <- gsub("-freq()", "Frequency", names(TidyData), ignore.case = TRUE)
names(TidyData) <- gsub("-std", "STD", names(TidyData), ignore.case = TRUE)
names(TidyData) <- gsub("angle", "Angle", names(TidyData))
names(TidyData) <- gsub("gravity", "Gravity", names(TidyData))

       #step5: using step 4, creates a second, independent tidy data set with the average of each variable for each activity n each subject.

FinalData <- TidyData %>%
  group_by(subject, activity) %>%
  summarise_all(funs(mean))
write.table(FinalData, "FinalData.txt", row.name = FALSE)

       #step6: checking variable names
str(FinalData)

       # print the results

FinalData
