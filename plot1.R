power <- read.table("household_power_consumption.txt", sep=";",header = TRUE, na.strings = "?") ## Read in power data
power$Date <- strptime(power$Date, format="%d/%m/%y%y") ## Change date format
febdata <- subset(power, Date > "2007-01-31" & Date < "2007-02-03") ## Limit table to selected dates
png(filename = './plot1.png', width = 480, height = 480) ## Create png
hist(febdata$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)") ## Create histogram
dev.off()