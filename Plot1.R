
# Read data into data frame
clreadAll <- read.table("C:\\temp\\Data\\4. EDA\\household_power_consumption.txt", sep = ";", header = TRUE)

# convert Date into date format 
clreadAll$Date <- strptime(clreadAll$Date, "%d/%m/%Y")

# We want data only for 01/02/2007 - 02/02/2007
clreadAll <- subset(clreadAll, Date >= "2007-02-01" & Date <= "2007-02-02")


# Replace all ? with NA
clreadAll[,3:9][clreadAll[,3:9] == "?"] <- NA

#convert to numeric
clreadAll$Global_active_power <- as.numeric(as.character(clreadAll$Global_active_power))
clreadAll$Global_reactive_power <- as.numeric(as.character(clreadAll$Global_reactive_power))
clreadAll$Voltage <- as.numeric(as.character(clreadAll$Voltage))
clreadAll$Global_intensity <- as.numeric(as.character(clreadAll$Global_intensity))
clreadAll$Sub_metering_1 <- as.numeric(as.character(clreadAll$Sub_metering_1))
clreadAll$Sub_metering_2 <- as.numeric(as.character(clreadAll$Sub_metering_2))
clreadAll$Sub_metering_3 <- as.numeric(as.character(clreadAll$Sub_metering_3))

png("plot1.png", width = 480, height = 480)
hist(clreadAll$Global_active_power, main = "Global Active Power", ylab = "Frequency", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()
