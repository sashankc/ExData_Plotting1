# read the data file
consumptionData <- read.csv2("household_power_consumption.txt", stringsAsFactors=FALSE)
cData <- subset(consumptionData, Date == "1/2/2007" | Date =="2/2/2007")
cData$DT<-strptime(paste(cData[,1], cData[,2]), format="%d/%m/%Y %H:%M:%S") # append date and time and convert it to POSIX
cData[,3]<-as.numeric(cData[,3], na.rm=TRUE)
library(datasets)
# plot the graph
png(filename="plot3.png")
with(cData, plot(DT,Sub_metering_1, type="l", ylab="Energy sub metering", xlab=""))
with(cData, points(DT, Sub_metering_2, type="l", col="red"))
with(cData, points(DT, Sub_metering_3, type="l", col="blue"))
legend("topright", lty="solid", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
