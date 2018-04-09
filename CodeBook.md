# CodeBook - tidydata.txt 

This codebook can be used to understand the dataset tidydata.txt. This dataset is a tidied dataset derived from the UCI Human Activity Recognition (HAR) datasets. It was built from the recordings of 30 subjects performing 6 activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors. The tidy dataset contains the average values of 66 observations for each subject, activity pair. The 66 observations correspond to all available signals inthe data that correspond to mean or standad deviation measurments. It does not include those originally denoted as meanFreq(). 

The first two columns are subject, denoting the number of the subject (1-30), and activityname, denoting the activity name of the corresponding observation. 

The remaining columns represent average values of the named observations for each subject, activityname pair. The names of the observations have been edited to be tidy, all lower case with no punctuation or whitespace. Given the large amount of information encoded in these, a number of text tags have been used in the names, and more detail can be found on each tag in the following table: 

## Tags used in Column Headings other than subject, activity

| Tag | Description |
| --- | --- |
| time | Used to denote time domain signals, captured at a constant rate of 50 Hz then filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. |
| freq | Used to denore frequency domain signals. Indicates that the corresponding time domain signal has been processed through a Fast Fourier Transform (FFT) |
| x, y or z  |  Used to denote 3-axial signals in the X, Y and Z directions. |
| acc | Used to denote signals deriven from 3-axial raw signals recorded using the accelerometer. |
| gyro | Used to denote signals deriven from 3-axial raw signals recorded using the gyroscope. |
| body | The acceleration signals are separated into body & gravity signals using another low pass Butterworth filter with a corner frequency of 0.3 Hz. |
| gravity | The acceleration signals are separated into body & gravity signals using another low pass Butterworth filter with a corner frequency of 0.3 Hz. |
| jerk | Jerk signals are otained from the derivation of body linear acceleration and angular velocity. |
| mag | Denotes a magnitude, calculated from three-dimensional signals using the Euclidian norm. |
| mean | Denotes that the mean of the signal was taken per observation. The global mean of this was then taken per activity, subject pair. |
| std | Denotes that the standard deviation of the signal was taken per observation. The global mean of this was then taken per activity, subject pair. |

Each of the raw 10299 observations for each variable was normalized and bounded within [-1,1], therefore there are no units for the averages in the tidy dataset.

Additional information can bve found at the raw data source: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. 