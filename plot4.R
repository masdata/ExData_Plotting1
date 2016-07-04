power <- read.table("household_power_consumption.txt", sep=";",header = TRUE, na.strings = "?") ## Read in power data
power$Date <- strptime(power$Date, format="%d/%m/%y%y") ## Change date format
febdata <- subset(power,Date > "2007-01-31" & Date < "2007-02-03") ## Limit table to selected dates
datetime <- as.POSIXct(paste(febdata$Date,febdata$Time)) ## Merge date and times
datetimedata <- cbind(datetime,febdata) ## Merge all data
png(filename = './plot4.png', width = 480, height = 480) ## Creates png file
par(mfrow = c(2,2)) ## Creates 2x2 grid for graphs
plot(datetimedata$datetime,datetimedata$Global_active_power,type="l",col="black",xlab="",ylab="Global Active Power") ## Create graph
plot(datetimedata$datetime,datetimedata$Voltage,type="l",col="black",xlab="datetime",ylab="Voltage") ## Create graph
plot(datetimedata$datetime, datetimedata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", col="black") ## Create plot with sub metering 1
lines(datetimedata$datetime, datetimedata$Sub_metering_2, type="l", col = "red") ## Add sub metering 2
lines(datetimedata$datetime, datetimedata$Sub_metering_3, type="l", col = "blue") ## Add sub metering 3
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lwd=1, bty = "n") ## Add legend
plot(datetimedata$datetime, datetimedata$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()