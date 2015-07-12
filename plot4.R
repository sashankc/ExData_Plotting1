# read the data file
consumptionData <- read.csv2("household_power_consumption.txt", stringsAsFactors=FALSE)
cData <- subset(consumptionData, Date == "1/2/2007" | Date =="2/2/2007")
cData$DT<-strptime(paste(cData[,1], cData[,2]), format="%d/%m/%Y %H:%M:%S") # append date and time and convert it to POSIX
cData[,3]<-as.numeric(cData[,3], na.rm=TRUE)
library(datasets)
# plot the graph
png(filename="plot4.png")
par(mfrow=c(2,2))
with(cData, { 
  plot(DT,Global_active_power, type="l", ylab="Global Active Power", xlab="")
  plot(DT,Voltage, type="l", ylab="Voltage", xlab="datetime")
  plot(DT,Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
  points(DT, Sub_metering_2, type="l", col="red")
  points(DT, Sub_metering_3, type="l", col="blue")
  legend("topright", lty="solid", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(DT,Global_reactive_power, type="l", ylab="Global_reactive Power", xlab="datetime")
})
dev.off()
