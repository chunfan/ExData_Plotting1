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


## plot 1
# create png device
png("plot1.png", width=480, height=480)
# creat histogram on windows device
hist(twoDayData$Global_active_power, col="red", main="Glabal Active Power", xlab="Global Active Power (kilowatts)")
# close png device
dev.off()