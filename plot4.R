## Read in data from .txt file assumes file in working directory
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors=FALSE, na.strings = "?")
## Subset data to 2007-2-1 and 2007-2-2
plot_data <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")
## Combine Date & Time colums and delete Date and Time columns
plot_data$Date_Time <- paste(plot_data$Date, plot_data$Time, sep = " ")
plot_data$Date <- NULL
plot_data$Time <- NULL
## Convert Date_Time character string into date object
plot_data$Date_Time <- strptime(plot_data$Date_Time, "%d/%m/%Y %H:%M:%S")
## Open png devise
png(filename = "Plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
## Create plots
plot(plot_data$Date_Time, plot_data$Global_active_power, type = "l", xlab="", ylab = "Global Active Power (kilowatts)")
plot(plot_data$Date_Time, plot_data$Voltage, type = "l", xlab = "datetime", ylab ="Voltage")
plot(plot_data$Date_Time, plot_data$Sub_metering_1, type = "l", xlab ="", ylab = "Energy sub metering")
lines(plot_data$Date_Time, plot_data$Sub_metering_2, col = "red")
lines(plot_data$Date_Time, plot_data$Sub_metering_3, col = "blue")
legend("topright", lty=c(1,1, 1), bty = "n", col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(plot_data$Date_Time, plot_data$Global_reactive_power, type = "l", xlab = "datetime", ylab="Global_reactive_power")
## Close png device
dev.off()
