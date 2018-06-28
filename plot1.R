# Plot 1
# Read file and subset file 
consumption<-read.table("household_power_consumption.txt",sep = ";", header = TRUE, na.strings = "?")
consumption$Date<-as.Date(consumption$Date,"%d/%m/%Y")
consumption1<-consumption[("2007-02-02">=consumption$Date) & (consumption$Date>="2007-02-01"),]

# Plot Hitogram
hist(consumption1$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "Red")

# Save file as png
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()