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
