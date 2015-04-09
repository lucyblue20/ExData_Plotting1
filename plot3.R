
## Load required packages into R


library(dplyr) 



##unzip the compressed data files
datafile<-unzip("exdata_data_household_power_consumption.zip")

##read fragment of large data set into file named "data"
data <- read.csv("household_power_consumption.txt", header = TRUE,sep=";",
                 stringsAsFactors=FALSE,na.strings="?", nrows=75000)


##subset rows cooresponding to the dates Feb., 1-2, 2007
subdata<-filter(data, Date=="1/2/2007"|Date=="2/2/2007")

##Combine Date and Time into one column and reformat to "POSIXlT" and "POSIXt"
subdata$DateTime = paste(subdata$Date, subdata$Time)
subdata$DateTime =  strptime(subdata$DateTime, "%d/%m/%Y %H:%M:%S")

##plot data and label appropriately
with(subdata, plot(DateTime,Sub_metering_1,type="n",xlab=" ",ylab="Energy sub metering", main=" "))
                   
with(subdata,lines(DateTime,Sub_metering_1, col ="black"))
with(subdata,lines(DateTime,Sub_metering_2, col ="red"))
with(subdata,lines(DateTime,Sub_metering_3, col ="blue"))

##add legend
legend("topright",lty=1:1:1, col = c( "black","red", "blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


##create PNG file of plot
png(file="plot3.png",width=480, height=480)
with(subdata, plot(DateTime,Sub_metering_1,type="n",xlab=" ",ylab="Energy sub metering", main=" "))

with(subdata,lines(DateTime,Sub_metering_1, col ="black"))
with(subdata,lines(DateTime,Sub_metering_2, col ="red"))
with(subdata,lines(DateTime,Sub_metering_3, col ="blue"))
legend("topright",lty=1:1:1, col = c( "black","red", "blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()