# read the data file
consumptionData <- read.csv2("household_power_consumption.txt", stringsAsFactors=FALSE)
cData <- subset(consumptionData, Date == "1/2/2007" | Date =="2/2/2007")
cData$DT<-strptime(paste(cData[,1], cData[,2]), format="%d/%m/%Y %H:%M:%S") # append date and time and convert it to POSIX
cData[,3]<-as.numeric(cData[,3], na.rm=TRUE)
library(datasets)
# plot the graph
png(filename="plot2.png")
with(cData, plot(DT,Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=""))
dev.off()
