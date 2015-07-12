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
# convert the global active power field to numeric
cData[,3]<-as.numeric(cData[,3], na.rm=TRUE)

# plot the graph
# create a new file device
png(filename="plot2.png")
# create a line plot by using the parameter type="l", add axis labels
with(cData, plot(DT,Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=""))
# close the device
dev.off()
