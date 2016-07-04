power <- read.table("household_power_consumption.txt", sep=";",header = TRUE, na.strings = "?") ## Read in power data
power$Date <- strptime(power$Date, format="%d/%m/%y%y") ## Change date format
febdata <- subset(power,Date > "2007-01-31" & Date < "2007-02-03") ## Limit table to selected dates
datetime <- as.POSIXct(paste(febdata$Date,febdata$Time)) ## Merge date and times
datetimedata <- cbind(datetime,febdata) ## Merge all data
png(filename = './plot3.png', width = 480, height = 480) ## Create png
plot(datetimedata$datetime, datetimedata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", col="black") ## Create plot with sub metering 1
lines(datetimedata$datetime, datetimedata$Sub_metering_2, type="l", col = "red") ## Add sub metering 2
lines(datetimedata$datetime, datetimedata$Sub_metering_3, type="l", col = "blue") ## Add sub metering 3
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lwd=1) ## Add legend
dev.off()