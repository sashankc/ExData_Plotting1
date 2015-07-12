# read the data file from the disk
# the StringsAsFactors=FLASE makes sure that the data is not read as as factors
# with this flag, the columns are read as charcters instead
consumptionData <- read.csv2("household_power_consumption.txt", stringsAsFactors=FALSE)
# For filtering the data to 1/2/2007 to 2/2/2007 use the subset function,
# this filter could have been done differently however this is best way to do so using 
# string comparison.
cData <- subset(consumptionData, Date == "1/2/2007" | Date =="2/2/2007")
# add a new column DT which is a POSIXlt type field by '
# first pasting the date and time character fields and then applying the strptime function 
cData$DT<-strptime(paste(cData[,1], cData[,2]), format="%d/%m/%Y %H:%M:%S") # append date and time and convert it to POSIX

# plot the graph
# create a new file device
png(filename="plot3.png")
# use the with function to add the plot, use the DT field for the days of the week
with(cData, plot(DT,Sub_metering_1, type="l", ylab="Energy sub metering", xlab=""))
# use the with function to add more points (graps data)
with(cData, points(DT, Sub_metering_2, type="l", col="red"))
# use the with function to add more points (graps data)
with(cData, points(DT, Sub_metering_3, type="l", col="blue"))
# add the legends for the three data points
legend("topright", lty="solid", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
# close the device
dev.off()
