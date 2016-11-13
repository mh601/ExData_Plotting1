myfile <- "./household_power_consumption.txt"
mydata <- read.table(myfile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## Selectdates 2007-02-01 and 2007-02-02
mysubset <- mydata[mydata$Date %in% c("1/2/2007","2/2/2007") ,]

#Create plot 3 
datetime <- strptime(paste(mysubset$Date, mysubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(mysubset$Global_active_power)
submeter1 <- as.numeric(mysubset$Sub_metering_1)
submeter2 <- as.numeric(mysubset$Sub_metering_2)
submeter3 <- as.numeric(mysubset$Sub_metering_3)
globalReactivePower <- as.numeric(mysubset$Global_reactive_power)
voltage <- as.numeric(mysubset$Voltage)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, submeter1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, submeter2, type="l", col="red")
lines(datetime, submeter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
