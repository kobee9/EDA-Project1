# Plot 4
# Read file and subset file 
consumption<-read.table("household_power_consumption.txt",sep = ";", header = TRUE, na.strings = "?")
consumption$Date<-as.Date(consumption$Date,"%d/%m/%Y")
consumption1<-consumption[("2007-02-02">=consumption$Date) & (consumption$Date>="2007-02-01"),]

# Convert dates and times
consumption1$datetime <- strptime(paste(consumption1$Date, consumption1$Time), "%Y-%m-%d %H:%M:%S")

# Plot 4
consumption1$datetime <- as.POSIXct(consumption1$datetime)
par(mfrow = c(2, 2),mar=c(2,2,2,2))
plot(consumption1$Global_active_power ~ consumption1$datetime, type = "l", ylab = "Global Active Power", xlab = "")
plot(consumption1$Voltage ~ consumption1$datetime, type = "l",ylab = "Voltage", xlab = "")
plot(consumption1$Sub_metering_1 ~ consumption1$datetime, type = "l", ylab = "Energy sub metering", xlab = "")
lines(consumption1$Sub_metering_2 ~ consumption1$datetime, col = "Red")
lines(consumption1$Sub_metering_3 ~ consumption1$datetime, col = "Blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(consumption1$Global_reactive_power ~ consumption1$datetime, type = "l",ylab = "Global_reactive_power", xlab = "datetime")
dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()
