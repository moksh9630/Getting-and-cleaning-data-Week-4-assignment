# Code Book for Getting and Cleaning data week 4 assignment

url contains the URL of the link from which data is to be downloaded 
x_train , y_train, s_train,x_test,y_test,s_test , x_com,y_com,s_com are used to upload the data from the local directory and merge the training and the test data.
fea contains the names of the variables that are being recorded against every volunter in x_train and x_test data set
x_mean, x_std and x_com1 are used to extract only those columns which recored the mean and standard deviation from all the variables that are recorded
act contains the labels for the codes which are used for 6 physical activities which are performed by the volunteer
final data set contains the complete information of every recording against each physical activity and each volunteer
melt_data simplifies the data from final data and puts all the values into one single column based on volunteer and physical activity
cast_data contains the tidy data set which contains the average of each mean and standard deviation variable against each volunteer and each Physical activity.
