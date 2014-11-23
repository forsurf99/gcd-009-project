### Introduction

As a part of the submission of the project, various files are included in the repository.
These files should be read in following order to quickly understand the implementation:

1. *README.md* - This file.
2. *codebook.md* - The  code book that explains various variables in the tidy data set.
3. *run_analysis.R* - The script the transforms the orginal data set into tidy data set.
4. *gcd-project-data.txt* - The TXT file that contains the actual tidy data set.


### Working of *run_analysis.R* script

Sufficient inline documentation has been included in the *run_analysis.R* script for 
the grader / evaluator to understand the implementation. Here is some important information
about the script.

#### Packages

The script requires base, plyr, and data.table packages. It is assumed that the required packages
are available on the machine when the script will run.

#### Assumptions

Most of the coding along with inline documentation should be self-explainatory. From the viewpoing
of good coding practices, this code can be easily broken down into multiple functions. However
the script implements all the tasks in a big monolithic code to improve readability for the grader.

It is also assumed that the original data set and all other files are included in the folder "UCI HAR Dataset"
and this folder is directly copied into the 'working directory'. The file paths in the script are hardcoded
with respect to the working directory.

#### Seqeunce of tasks

The project description lists 5 different tasks to be implemented in the script. The task seqeunce has 
been  slightly changed to accommodate the nuances of its previous step implementation. This is explained
in the inline documentation.

However at the end of all these task implementation, the tidy data has ...
* merged training and test data sets
* the measurements only on mean and standard deviation 
* descriptive activity names
* sufficiently descriptive variable names
* measurement values that are averages of each variable for each activity and each subject

#### Working
 
The script reads required data set files as required and merges them to form **allData** dataset.
This data set includes all required columns/variables with subject and activity information. Final
tidy data set is available in **tidyData** variable.

The original feature names specified in the TXT file have illegal characters. The required feature
name a.k.a. variable names are lightly processed to make them more descriptive. However it is assumed
that the end user understand the meaning of the signal names, such as, BodyAcc, BodyGyroMag etc.

The script working can be summarized as follows:

1 It combines the training and test data sets / variables using *rbind()* and *cbind()* functions.
2 Only the feature / variable names containing words "mean" or "std" have been selected.
3 Descriptive names of the activities have been added towards the end as explained in inline documentation.
4 The mean for each variable for distinct subject & activity combination is calculated using *ddply()* and *colMeans()* functions.
5 The important variable names to look at are *allData* and *tidyData*.

#### Running the script

The script can be run using follwing function.

*source('run_analysis.R')*




