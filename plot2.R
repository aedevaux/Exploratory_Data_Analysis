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
png(filename = "Plot2.png", width = 480, height = 480)
## Create plot2
plot(plot_data$Date_Time, plot_data$Global_active_power, type = "l", xlab="", ylab = "Global Active Power (kilowatts)")
## Close png device
dev.off()