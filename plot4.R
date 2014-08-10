## Load Data

# set the class for each column
classes <- c("character", "character", rep("numeric", 7))
# read data 
data <- read.table("household_power_consumption.txt", sep=";", na.strings = "?", header=TRUE)
# set the first column as variables of date class 
data$Date <- as.Date(data$Date, "%d/%m/%Y")
# combine both date and time into a single string
dataDateTime <- paste(data[,"Date"], data[,"Time"], sep=" ")
# set the second column as variables of posIXlt class
data$Time <- strptime(dataDateTime, "%Y-%m-%d %H:%M:%S")
# Extract data from the dates 2007-02-01 and 2007-02-02
twoDayData <- data[data$Date=="2007-02-01" | data$Date=="2007-02-02",]

## plot 4
# create png device
png("plot4.png", width=480, height=480)

# set subplot matirx
par(mfrow=c(2,2), cex=0.75)

# create Global Active Power line plots
plot(twoDayData$Time, twoDayData$Global_active_power, type="l", xlab="", ylab="Global Active Power")

# create Voltage line plots
plot(twoDayData$Time, twoDayData$Voltage, type="l", xlab="", ylab="Volatge")

# create multi energy sub metering  plots
# create an empty plot
with(twoDayData, plot(Time, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering"))
# creta Sub_metering_1 line subplots
with(twoDayData, lines(Time, Sub_metering_1, col="black"))
# creta Sub_metering_2 line subplots
with(twoDayData, lines(Time, Sub_metering_2, col="red"))
# creta Sub_metering_3 line subplots
with(twoDayData, lines(Time, Sub_metering_3, col="blue"))
# annotate legend
legend("topright", bty = "n", lty=c(1,1,1), lwd=c(1,1,1), col=c("black", "red", "blue"), legend=c("Sub metering 1", "Sub metering 2", "Sub metering 3"))

# create global reactive power line plot
plot(twoDayData$Time, twoDayData$Global_reactive_power, type="l", xlab="", ylab="Global Reactive Power")

# close png device
dev.off()