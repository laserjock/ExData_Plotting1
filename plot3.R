library(dplyr)

## Load in data ##
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "data.zip", method = "curl")
unzip("data.zip")
raw_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
data <- filter(raw_data, Date == "1/2/2007" | Date == "2/2/2007")

## Convert the Data and Time character vectors to POSIXlt dates
data$Time <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")

## Do the actual plotting to a PNG file ##
png("plot3.png")
plot(data$Time, data$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(data$Time, data$Sub_metering_2, col = "red")
lines(data$Time, data$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), lty = c(1,1,1), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
