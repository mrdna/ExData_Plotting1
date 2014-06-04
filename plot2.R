data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", nrows= 300000, stringsAsFactors=FALSE)
  ##read first 400000 rows of data into R
data2 <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
  ## subset dates
data2$DateTime <- paste(data2$Date, data2$Time)
  ##combine Date and Time columns to a new DateTime variable
data2$datetime <- strptime(as.character(data2$DateTime), "%d/%m/%Y %H:%M:%S")
  ##create datetime column of Date formated in POSIXlt with name that matches graph axis title
x <- data2$datetime ##x axis data
y <- data2$Global_active_power ##y axis data
png(file="plot2.png",width=480,height=480) ##create file to save plot
plot(x,y, type = "l", xlab="", ylab="Global Active Power (kilowatts)")
  ##plotting commands
dev.off() ##disconnect from graphics device