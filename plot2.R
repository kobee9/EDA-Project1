# Plot 2
# Read file and subset file 
consumption<-read.table("household_power_consumption.txt",sep = ";", header = TRUE, na.strings = "?")
consumption$Date<-as.Date(consumption$Date,"%d/%m/%Y")
consumption1<-consumption[("2007-02-02">=consumption$Date) & (consumption$Date>="2007-02-01"),]

# Convert dates and times
consumption1$datetime <- strptime(paste(consumption1$Date, consumption1$Time), "%Y-%m-%d %H:%M:%S")

# Plot global_active _power vs datatime
consumption1$datetime <- as.POSIXct(consumption1$datetime)
plot(consumption1$Global_active_power ~ consumption1$datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()