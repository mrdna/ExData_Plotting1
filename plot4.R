data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", nrows= 300000, stringsAsFactors=FALSE)
  ##read first 400000 rows of data into R
data2 <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
  ## subset dates
data2$DateTime <- paste(data2$Date, data2$Time)
  ##combine Date and Time columns to a new DateTime variable
data2$datetime <- strptime(as.character(data2$DateTime), "%d/%m/%Y %H:%M:%S")
  ##create datetime column of Date formated in POSIXlt with name that matches graph axis title
x <- data2$datetime ##x axis data
y <- data2$Global_active_power
y1 <- data2$Sub_metering_1
y2 <- data2$Sub_metering_2
y3 <- data2$Sub_metering_3
v <- data2$Voltage
g <- data2$Global_reactive_power
png(file="plot4.png",width=480,height=480) ##create file to save plot
par(mfrow=c(2,2)) ##set up canvas to make 4 plots
plot(x,y, type = "l", xlab="", ylab="Global Active Power (kilowatts)") ##plot first
plot(x,v, type="l", xlab="datetime", ylab="Voltage")
plot(x,y1,xlab="", ylab="Energy sub metering", type="l",col="black") ##plot third then add lines
lines(x,y2, type="l", col="red")
lines(x,y3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=c(2.5,2.5,2.5), col=c("black", "red", "blue"))
  ##end plotting commands for third
plot(x,g, type="l", xlab="datetime", ylab="Global_reactive_power") ##plot fourth
dev.off() ##disconnect from graphics device