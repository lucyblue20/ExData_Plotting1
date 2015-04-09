
## Load required packages into R


library(dplyr) 



##unzip the compressed data files
datafile<-unzip("exdata_data_household_power_consumption.zip")

##read fragment of large data set into file named "data"
data <- read.csv("household_power_consumption.txt", header = TRUE,sep=";",
        stringsAsFactors=FALSE,na.strings="?",
         nrows=75000)


##subset rows cooresponding to the dates Feb., 1-2, 2007
subdata<-filter(data, Date=="1/2/2007"|Date=="2/2/2007")

#create histogram of Global active power data vs. frequency
hist(subdata$Global_active_power,col="red", border="black",main="Global Active Power",xlab="Global Active Power (kilowatts)")

##create PNG file of histogram
png(file="plot1.png",  width=480, height=480)
with(subdata,hist(subdata$Global_active_power,col="red", border="black",main="Global Active Power",xlab="Global Active Power (kilowatts)"))
dev.off()

