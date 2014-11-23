

require(plyr)
require(data.table)

# NOTES
# Following implementation can be refactored into multiple functions. However,
# it is kept in the sequence below for easy readability for the evaluator.
#
# The task seqeunce has been  slightly changed to accommodate the nuances of its previous step
# implementation (explained below)
#
# At the end of all tasks/steps, the tidyData has everything as mentioned in the description
# of the project.


#Read features.txt. This is list of all features aka variables (columns)
features <- read.table("UCI HAR Dataset/features.txt") #dimension 561 X 2

#Read activity labels. This includes mapping of activity-number to activity-name
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt") #dimension 6 x 2 


# All X_??? files include measurements
#Read training data
trainingData <- read.table("UCI HAR Dataset/train/X_train.txt") #dimension 7352 x 561

#Read test data
testData <- read.table("UCI HAR Dataset/test/X_test.txt")  #dimension 2947 X 561

# [TASK-1] : Merge training and test data sets to create one data set
allData <- rbind(trainingData, testData)

# [TASK-2] Extracts only the measurements on the mean and standard deviation 
# First set the allData column names from feature list
colnames(allData) <- features$V2
# Select the column names that include 'mean' and 'std' in their names
selectedColumns <- grepl("mean|std", colnames(allData))
# Filter out all remaining columns from allData
allData <- allData[selectedColumns]
#Now allData includes only required columns
# Activity and subject information will be added later (see below)


# Note TASK-3 will be done towards the end as it is more efficient to process then

# [TASK-4] Appropriately label the data set with descriptive variable names i.e. column names
# Given column names include illegal characters
# Extract columns names again and process them as follows ...
# Remove illegal characters
cn <- make.names(colnames(allData), unique=TRUE) 
# Replace the beginning letter 't' with 'timeSignal'
cn <- gsub("^t", "timeSignal.", cn)
# Replace the beginning letter 'f' with 'freqSignal'
cn <- gsub("^f", "freqSignal.", cn)
# Replace word 'std' with 'stdDev'
cn <- gsub("std", "stdDev", cn)
# Remove extra '.' character/s in the names
cn <- gsub("\\.{3}", ".", cn)
cn <- gsub("\\.{2}", ".", cn)
cn <- gsub('\\.$', '', cn)
# Replace 'X' with 'X.Axis'
cn <- gsub("X", "X.Axis", cn)
# Replace 'Y' with 'Y.Axis'
cn <- gsub("Y", "Y.Axis", cn)
# Replace 'Z' with 'X.Axis'
cn <- gsub("Z", "Z.Axis", cn)
# Set more descriptive column names back into allData
colnames(allData) <- cn
# Examples of final column names ...
#     timeSignal.BodyAcc.mean.X.Axis
#     freqSignal.BodyAcc.stdDev.X.Axis



#All Y_??? files include activity numbers for each meansurement record
# Read activity numbers used for training
trainingActivity <- read.table("UCI HAR Dataset/train/Y_train.txt") #dimension 7352 x 1

#Read activity numbers used for testing
testActivity <- read.table("UCI HAR Dataset/test/Y_test.txt") #dimension  2947 x 1

# Merge training and testing activity numbers
allActivity <- rbind(trainingActivity, testActivity)


# Read subject files that include list of volunteers participated in trainign/testing
# Read test subjects/volunteer
testSubjects <- read.table("UCI HAR Dataset/test/subject_test.txt") #dimension 2947 x 1 
# Read train subjects/volunteer
trainingSubjects <- read.table("UCI HAR Dataset/train/subject_train.txt") #dimension 7352 x 1
# Merge training and testing subject lists
allSubjects <- rbind(trainingSubjects, testSubjects)
# Provide meaningful name to the column variable
names(allSubjects)<- c('subject')

#Combine activity and subject inforamation with allData
allData <- cbind(Activity=allActivity$V1, allData)
allData <- cbind(Subject=allSubjects$subject, allData)
#Now allData includes all required columns/variables with subject and activity information


# [TASK-5] create a second, independent tidy data set with the average of each variable 
#         for each activity and each subject
tidyData <- ddply(allData, .(Subject, Activity), colMeans) # dimension 180 X 81


# [TASK-3] Use descriptive activity names to name the activities in the data set

# NOTES - 
# The colMeans() function used in ddply() cannot work with string values
# so TASK-3 is done after TASK-5. This also allows us to change the activity names
# for smaller dataset
#
# Though this task is done only for tidyData, it can also be done for allData 
# (code not included here)

# Add a new temporary column in tidyData at first position
tidyData <- cbind(actName=c("inv"), tidyData)
tidyData$actName <- "inv"

# Since Activity has only 6 values, following code is written instead of for-loop
# for better readability

# For activity number = 1, retrieve the activity name from activityLabels
val <- as.character(activityLabels$V2[activityLabels$V1 == 1])
# Set this name in tidyData for every record where Activity = 1
tidyData$actName[tidyData$Activity == 1] <- val

# Repeat above 2 steps for activity number 2, 3, 4, 5, and 6
val <- as.character(activityLabels$V2[activityLabels$V1 == 2])
tidyData$actName[tidyData$Activity == 2] <- val

val <- as.character(activityLabels$V2[activityLabels$V1 == 3])
tidyData$actName[tidyData$Activity == 3] <- val

val <- as.character(activityLabels$V2[activityLabels$V1 == 4])
tidyData$actName[tidyData$Activity == 4] <- val

val <- as.character(activityLabels$V2[activityLabels$V1 == 5])
tidyData$actName[tidyData$Activity == 5] <- val

val <- as.character(activityLabels$V2[activityLabels$V1 == 6])
tidyData$actName[tidyData$Activity == 6] <- val

# Set Activity column values same as actName values
tidyData$Activity <- tidyData$actName

# For readability, sort the tidyData, first by Subject and then by Activity
dt <- data.table(tidyData)
dt <- dt[order(Subject, Activity)]
tidyData <- as.data.frame(dt)

# Remove temporary column actName from tidyData
tidyData <- tidyData[,-1]

# Now tidyData has ...
# A> merged training and test data sets
# B> the measurements only on mean and standard deviation 
# C> descriptive activity names
# D> sufficiently descriptive variable names
# E> measurement values that are averages of each variable for each activity and each subject

#Sample output
#    Subject          Activity timeSignal.BodyAcc.mean.X.Axis timeSignal.BodyAcc.mean.Y.Axis ...
#1        1             LAYING                      0.2215982                   -0.040513953
#2        1            SITTING                      0.2612376                   -0.001308288
#3        1           STANDING                      0.2789176                   -0.016137590
#4        1            WALKING                      0.2773308                   -0.017383819
#5        1 WALKING_DOWNSTAIRS                      0.2891883                   -0.009918505
#6        1   WALKING_UPSTAIRS                      0.2554617                   -0.023953149
#7        2             LAYING                      0.2813734                   -0.018158740
#8        2            SITTING                      0.2770874                   -0.015687994
# 


# Write the tidyData to file for submission
write.table(tidyData, "gcd-project-data.txt", row.names = FALSE)

# (optional test) read the data back from the file for visual integrity checks
#dataToCheck <- read.table("gcd-project-data.txt")
