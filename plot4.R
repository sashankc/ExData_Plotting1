
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
png(filename="plot4.png")
# create a partition of 2 rows by 2 columns
par(mfrow=c(2,2))
# using the data cData here would save us typing it over and over again.
with(cData, { 
# plot the first graph of day of the week versus global active power
  plot(DT,Global_active_power, type="l", ylab="Global Active Power", xlab="")
# plot the second graph of day of the week versus voltage
  plot(DT,Voltage, type="l", ylab="Voltage", xlab="datetime")
# plot the third  graph of day of the week versus submetering1, submetering2 and submetering 3 using points.
  plot(DT,Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
  points(DT, Sub_metering_2, type="l", col="red")
  points(DT, Sub_metering_3, type="l", col="blue")
  legend("topright", lty="solid", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
# plot the foirth graph of day of the week versus global reactive power
  plot(DT,Global_reactive_power, type="l", ylab="Global_reactive Power", xlab="datetime")
})
# close the device
dev.off()
