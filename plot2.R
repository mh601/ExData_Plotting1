myfile <- "./household_power_consumption.txt"
mydata <- read.table(myfile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## Selectdates 2007-02-01 and 2007-02-02
mysubset <- mydata[mydata$Date %in% c("1/2/2007","2/2/2007") ,]

#Create plot 2 for Global Active Power
datetime <- strptime(paste(mysubset$Date, mysubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(mysubset$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
