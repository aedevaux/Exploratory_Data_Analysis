## Read in data from .txt file assumes file in working directory
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
## Subset data to 2007-2-1 and 2007-2-2
data_two <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")
## Open png devise
png(filename = "Plot1.png", width = 480, height = 480,)
## Create plot1
hist(data_two$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
## Close png device
dev.off()