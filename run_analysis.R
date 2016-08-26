## It downloads the data from the link and stores it in zip folder and then unzips it into a directory
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url,"UCI.zip")
unzip("UCI.zip",exdir = "UCI")

library(reshape)
library(reshape2)

## reads data from the files in the unzipped folder into R
act <- read.table("C:/Users/Sony/Documents/UCI/activity_labels.txt")
fea <- read.table("C:/Users/Sony/Documents/UCI/features.txt")
x_train <- read.table("C:/Users/Sony/Documents/UCI/train/X_train.txt")
y_train <- read.table("C:/Users/Sony/Documents/UCI/train/y_train.txt")
s_train <- read.table("C:/Users/Sony/Documents/UCI/train/subject_train.txt")
x_test <- read.table("C:/Users/Sony/Documents/UCI/test/X_test.txt")
y_test <- read.table("C:/Users/Sony/Documents/UCI/test/y_test.txt")
s_test <- read.table("C:/Users/Sony/Documents/UCI/test/subject_test.txt")
## combines the training and test data set 
x_com <- rbind(x_train,x_test)
y_com <- rbind(y_train,y_test)
s_com <- rbind(s_train,s_test)

## selects only those columns in the main file which records mean and standard deviation for each variable
x_mean <- x_com[,grep(".*mean.*",fea[,2])]
names(x_mean) <- fea[grep(".*mean.*",fea[,2]),2]
x_std <- x_com[,grep(".*std.*",fea[,2])]
names(x_std) <- fea[grep(".*std.*",fea[,2]),2]
x_com1 <- data.frame(x_mean,x_std)

y_com[,1] <- act[y_com[,1],2]
names(y_com) <- "Physical.Activity"
names(s_com) <- "volunteer"
final <- data.frame(x_com1,y_com,s_com)
## Simplifies the data by putting all the mean values in a single column based on volunteer and physical activity
melt_data <- melt(final, id = c("volunteer","Physical.Activity"))
## it creates the tidy data set of averages of mean and standard deviation of all variables against each volunteer and Physical activity
cast_data <- dcast(melt_data , variable ~ volunteer + Physical.Activity,mean)

tidydata <- write.table(cast_data,"C:/Users/Sony/Documents/UCI/tidydata.txt")