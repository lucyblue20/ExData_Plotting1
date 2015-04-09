
## Load required packages into R


library(dplyr) 



##unzip the compressed data files
datafile<-unzip("exdata_data_household_power_consumption.zip")

##read fragment of large data set into file named "data"
data <- read.csv("household_power_consumption.txt", header = TRUE,sep=";",
                 stringsAsFactors=FALSE, nrows=75000)


##subset rows cooresponding to the dates Feb., 1-2, 2007
subdata<-filter(data, Date=="1/2/2007"|Date=="2/2/2007")

##Combine Date and Time into one column and reformat to "POSIXlT" and "POSIXt"
subdata$DateTime = paste(subdata$Date, subdata$Time)
subdata$DateTime =  strptime(subdata$DateTime, "%d/%m/%Y %H:%M:%S")

##plot data and label axises appropriately
with(subdata, plot(DateTime,Global_active_power,type="l",xlab=" ",
                   ylab="Global Active Power (kilowatts)", main=" "))

##create PNG file of graph
png(file="plot2.png",width=480, height=480)
with(subdata, plot(DateTime,Global_active_power,type="l",xlab=" ",ylab="Global Active Power (kilowatts)", main=" "))
dev.off()