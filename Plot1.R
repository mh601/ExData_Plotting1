myfile <- "./household_power_consumption.txt"
mydata <- read.table(myfile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## Selectdates 2007-02-01 and 2007-02-02
mysubset <- mydata[mydata$Date %in% c("1/2/2007","2/2/2007") ,]

#Create plot 1 for Global Active Power
globalActPwr <- as.numeric(mysubset$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActPwr, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
