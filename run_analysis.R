# Step 1  Merges the Training and test seyt to create the one data set.

X <- rbind(x_train, x_test)
Y <- rbind(y_train, y_test)
