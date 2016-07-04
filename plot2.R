power <- read.table("household_power_consumption.txt", sep=";",header = TRUE, na.strings = "?") ## Read in power data
power$Date <- strptime(power$Date, format="%d/%m/%y%y") ## Change date format
febdata <- subset(power, Date > "2007-01-31" & Date < "2007-02-03") ## Limit table to selected dates
datetime <- as.POSIXct(paste(febdata$Date, febdata$Time)) ## Merge date and times
datetimedata <- cbind(datetime,febdata) ## Merge all data
png(filename = './plot2.png', width = 480, height = 480) ## Create png
plot(datetimedata$datetime, datetimedata$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power (kilowatts)") ## Create graph
dev.off()