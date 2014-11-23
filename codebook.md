
## Introduction 

This tidy data set was created from following loose data set -
[Human Activity Recognition Using Smartphone Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#)

The explaination of features selected in original data set and how they were processed is included at the bottom of this document. Many variables were calculated from these features, for example, mean, std, mad, max etc.

## Brief note about signals

Raw signal data from the accelerometer and gyroscope in smarphones were measured and processed to produce various variables in the data set. A few of these variables are based on time domain signal and others are based on frequency domain signals. The explanation and purpose of these signals is explained in the link given above. For the rest of this document it is assumed that the end user either understands what these signals mean or has access to additional material that explain the purpose of these signals.

### Signals based on time domain signals 

These are :
* **BodyAcc**
* **GravityAcc**
* **BodyAccJerk**
* **BodyGyro**
* **BodyGyroJerk**
* BodyAccMag
* GravityAccMag
* BodyAccJerkMag
* BodyGyroMag
* BodyGyroJerkMag

The signal highlighted in **bold** font are available for 3 axis - X, Y, and Z.

### Signals based on frequency domain signals

These are :
* **BodyAcc**
* **BodyAccJerk**
* **BodyGyro**
* BodyAccMag
* BodyAccJerkMag
* BodyGyroMag
* BodyGyroJerkMag

The signal highlighted in **bold** font are available for 3 axis - X, Y, and Z.


## Variable selection based on these signals

Many variables were calculated from these signals using, for example, mean, std, mad, max etc. methods. As a part of this tidy data set only 'mean' and 'standard deviation' variables have been selected from original data set. All remaining variables from original data set have been droped. 

### Variable names

The variable names in tidy data set are multipart separated by '.' character. Here is the explanation of various parts.

#### Domain signals

* Variable created from time domain signal has word 'timeSignal' in its name.
* Variable created from frequency domain signal has word 'freqSignal' in its name.

#### Signal name

The variable based on the signals (explained in previous section) include the signal name as-is in its name. This is true for both time domain signal and frequency domain signal.

#### Only 'mean' or 'standard daviation'

Variable calculation based only on 'mean' or 'standard daviation' have been included in the tidy data set.
* Variable based on mean value has word 'mean' in its name
* Variable based on standard daviation has workd 'stdDev' in its name

#### 3-axis signals

Some signals are measured for 3 axis - X, Y, and Z. The variables that are based on 3-axis signals have either X or Y or Z in their names.

#### Other variables

In addition, following variables are used in the tidy data set.
* _Subject_ : This numeric value corrsponds to one of 30 volunteers participated in the tests. Range : 1 to 30
* _Activity_ : This string value represents one of 6 activities
  * WALKING
  * WALKING_UPSTAIRS
  * WALKING_DOWNSTAIRS
  * SITTING
  * STANDING
  * LAYING
 
#### Variable names in tidy data set

Based on above explanation, here is list of all variables in tidy data set.

Subject                                
Activity                               
timeSignal.BodyAcc.mean.X.Axis         
timeSignal.BodyAcc.mean.Y.Axis         
timeSignal.BodyAcc.mean.Z.Axis         
timeSignal.BodyAcc.stdDev.X.Axis       
timeSignal.BodyAcc.stdDev.Y.Axis       
timeSignal.BodyAcc.stdDev.Z.Axis       
timeSignal.GravityAcc.mean.X.Axis      
timeSignal.GravityAcc.mean.Y.Axis      
timeSignal.GravityAcc.mean.Z.Axis      
timeSignal.GravityAcc.stdDev.X.Axis    
timeSignal.GravityAcc.stdDev.Y.Axis    
timeSignal.GravityAcc.stdDev.Z.Axis    
timeSignal.BodyAccJerk.mean.X.Axis     
timeSignal.BodyAccJerk.mean.Y.Axis     
timeSignal.BodyAccJerk.mean.Z.Axis     
timeSignal.BodyAccJerk.stdDev.X.Axis   
timeSignal.BodyAccJerk.stdDev.Y.Axis   
timeSignal.BodyAccJerk.stdDev.Z.Axis   
timeSignal.BodyGyro.mean.X.Axis        
timeSignal.BodyGyro.mean.Y.Axis        
timeSignal.BodyGyro.mean.Z.Axis        
timeSignal.BodyGyro.stdDev.X.Axis      
timeSignal.BodyGyro.stdDev.Y.Axis      
timeSignal.BodyGyro.stdDev.Z.Axis      
timeSignal.BodyGyroJerk.mean.X.Axis    
timeSignal.BodyGyroJerk.mean.Y.Axis    
timeSignal.BodyGyroJerk.mean.Z.Axis    
timeSignal.BodyGyroJerk.stdDev.X.Axis  
timeSignal.BodyGyroJerk.stdDev.Y.Axis  
timeSignal.BodyGyroJerk.stdDev.Z.Axis  
timeSignal.BodyAccMag.mean             
timeSignal.BodyAccMag.stdDev           
timeSignal.GravityAccMag.mean          
timeSignal.GravityAccMag.stdDev        
timeSignal.BodyAccJerkMag.mean         
timeSignal.BodyAccJerkMag.stdDev       
timeSignal.BodyGyroMag.mean            
timeSignal.BodyGyroMag.stdDev          
timeSignal.BodyGyroJerkMag.mean        
timeSignal.BodyGyroJerkMag.stdDev      
freqSignal.BodyAcc.mean.X.Axis         
freqSignal.BodyAcc.mean.Y.Axis         
freqSignal.BodyAcc.mean.Z.Axis         
freqSignal.BodyAcc.stdDev.X.Axis       
freqSignal.BodyAcc.stdDev.Y.Axis       
freqSignal.BodyAcc.stdDev.Z.Axis       
freqSignal.BodyAcc.meanFreq.X.Axis     
freqSignal.BodyAcc.meanFreq.Y.Axis     
freqSignal.BodyAcc.meanFreq.Z.Axis     
freqSignal.BodyAccJerk.mean.X.Axis     
freqSignal.BodyAccJerk.mean.Y.Axis     
freqSignal.BodyAccJerk.mean.Z.Axis     
freqSignal.BodyAccJerk.stdDev.X.Axis   
freqSignal.BodyAccJerk.stdDev.Y.Axis   
freqSignal.BodyAccJerk.stdDev.Z.Axis   
freqSignal.BodyAccJerk.meanFreq.X.Axis 
freqSignal.BodyAccJerk.meanFreq.Y.Axis 
freqSignal.BodyAccJerk.meanFreq.Z.Axis 
freqSignal.BodyGyro.mean.X.Axis        
freqSignal.BodyGyro.mean.Y.Axis        
freqSignal.BodyGyro.mean.Z.Axis        
freqSignal.BodyGyro.stdDev.X.Axis      
freqSignal.BodyGyro.stdDev.Y.Axis      
freqSignal.BodyGyro.stdDev.Z.Axis      
freqSignal.BodyGyro.meanFreq.X.Axis    
freqSignal.BodyGyro.meanFreq.Y.Axis    
freqSignal.BodyGyro.meanFreq.Z.Axis    
freqSignal.BodyAccMag.mean             
freqSignal.BodyAccMag.stdDev           
freqSignal.BodyAccMag.meanFreq         
freqSignal.BodyBodyAccJerkMag.mean     
freqSignal.BodyBodyAccJerkMag.stdDev   
freqSignal.BodyBodyAccJerkMag.meanFreq 
freqSignal.BodyBodyGyroMag.mean        
freqSignal.BodyBodyGyroMag.stdDev      
freqSignal.BodyBodyGyroMag.meanFreq    
freqSignal.BodyBodyGyroJerkMag.mean    
freqSignal.BodyBodyGyroJerkMag.stdDev  
freqSignal.BodyBodyGyroJerkMag.meanFreq

### Transformatoin used to get tidy data set

There were 30 volunteers (aka subjects) performing 6 different activities. Selected data from the original data set has been summarized using average function for each distinct subject & activity combination for each variable. Thus there are total 180 records (i.e. 30 * 6) for 79 averaged variables in the tidy data set.

#### Sample Data

```
   Subject           Activity        timeSignal.BodyAcc.mean.X.Axis    timeSignal.BodyAcc.mean.Y.Axis
1        1             LAYING                      0.2215982                   -0.040513953
2        1            SITTING                    0.2612376                   -0.001308288
3        1           STANDING                  0.2789176                   -0.016137590
4        1            WALKING                   0.2773308                   -0.017383819
5        1 WALKING_DOWNSTAIRS     0.2891883                   -0.009918505
6        1   WALKING_UPSTAIRS         0.2554617                   -0.023953149
7        2             LAYING                     0.2813734                   -0.018158740
8        2            SITTING                    0.2770874                   -0.015687994
9        2           STANDING                  0.2779115                   -0.018420827
10       2            WALKING                   0.2764266                   -0.018594920
11       2 WALKING_DOWNSTAIRS     0.2776153                   -0.022661416
12       2   WALKING_UPSTAIRS         0.2471648                   -0.021412113
13       3             LAYING                      0.2755169                   -0.018955679
```




## Feature selection in original data set

The features selected for the original database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean


