#install.packages("ggplot2")
#library(ggplot2)
# Read data into data frame
clreadAll <- read.table("C:\\temp\\Data\\4. EDA\\household_power_consumption.txt", sep = ";", header = TRUE)

# convert Date into date format 
clreadAll$Date <- strptime(paste(clreadAll$Date, clreadAll$Time), "%d/%m/%Y %H:%M:%S")
clreadAll <- clreadAll[,-2]
# We want data only for 01/02/2007 - 02/02/2007
clreadAll <- subset(clreadAll, Date >= "2007-02-01" & Date < "2007-02-03")

# Replace all ? with NA
clreadAll[,2:8][clreadAll[,2:8] == "?"] <- NA

#convert to numeric
clreadAll$Global_active_power <- as.numeric(as.character(clreadAll$Global_active_power))
clreadAll$Global_reactive_power <- as.numeric(as.character(clreadAll$Global_reactive_power))
clreadAll$Voltage <- as.numeric(as.character(clreadAll$Voltage))
clreadAll$Global_intensity <- as.numeric(as.character(clreadAll$Global_intensity))
clreadAll$Sub_metering_1 <- as.numeric(as.character(clreadAll$Sub_metering_1))
clreadAll$Sub_metering_2 <- as.numeric(as.character(clreadAll$Sub_metering_2))
clreadAll$Sub_metering_3 <- as.numeric(as.character(clreadAll$Sub_metering_3))

par(mfrow = c(2,2))
png("plot3.png", width = 480, height = 480)
with(clreadAll, plot(Date, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))
with(clreadAll, plot(Date, Voltage, type = "l", ylab = "Voltage", xlab = "datetime"))

plot(clreadAll$Date, clreadAll$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(clreadAll$Date, clreadAll$Sub_metering_2, type = "l", col="red")
lines(clreadAll$Date, clreadAll$Sub_metering_3, type = "l", col="blue")
legend("topright",lwd=1, col=c("black", "red", "blue"),legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

with(clreadAll, plot(Date, Global_reactive_power, type = "l", xlab = "datetime"))

dev.off()

