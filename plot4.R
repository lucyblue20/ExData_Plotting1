
## Load required packages into R


library(dplyr) 



##unzip the compressed data files
datafile<-unzip("exdata_data_household_power_consumption.zip")

##read fragment of large data set into file named "data"
data <- read.csv("household_power_consumption.txt", header = TRUE,sep=";",
                 stringsAsFactors=FALSE,na.strings="?",nrows=75000)

##subset rows cooresponding to the dates Feb., 1-2, 2007
subdata<-filter(data, Date=="1/2/2007"|Date=="2/2/2007")

##Combine Date and Time into one column and reformat to "POSIXlT" and "POSIXt"
subdata$DateTime = paste(subdata$Date, subdata$Time)
subdata$DateTime =  strptime(subdata$DateTime, "%d/%m/%Y %H:%M:%S")

##create multiple plots 
par(mfrow=c(2,2))


with(subdata, {
        plot(DateTime,Global_active_power,type="l",xlab=" ",ylab="Global Active Power", main=" ")
        plot(DateTime,Voltage,,type="l",xlab="datetime",ylab="Voltage", main=" ")
        plot(DateTime,Sub_metering_1,type="n",xlab=" ",ylab="Energy sub metering", main=" ")
        legend("topright",bty="n",lty=1:1:1, col = c( "black","red", "blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
                with(subdata,lines(DateTime,Sub_metering_1, col ="black"))
                with(subdata,lines(DateTime,Sub_metering_2, col ="red"))
                with(subdata,lines(DateTime,Sub_metering_3, col ="blue"))
                
        
        plot(DateTime,Global_reactive_power,type="l", xlab="datetime",ylab="Global_reactive_power", main=" ")
})

##create PNG file of graph
png(file="plot4.png",width=480, height=480)
par(mfrow=c(2,2))


with(subdata, {
        plot(DateTime,Global_active_power,type="l",xlab=" ",ylab="Global Active Power", main=" ")
        plot(DateTime,Voltage,type="l",xlab="datetime",ylab="Voltage", main=" ")
        plot(DateTime,Sub_metering_1,type="n",xlab=" ",ylab="Energy sub metering", main=" ")
        legend("topright",bty="n",lty=1:1:1, col = c( "black","red", "blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
        with(subdata,lines(DateTime,Sub_metering_1, col ="black"))
        with(subdata,lines(DateTime,Sub_metering_2, col ="red"))
        with(subdata,lines(DateTime,Sub_metering_3, col ="blue"))
        
        
        plot(DateTime,Global_reactive_power,type="l", xlab="datetime",ylab="Global_reactive_power", main=" ")
})
dev.off()