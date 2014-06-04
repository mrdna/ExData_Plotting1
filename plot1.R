data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", nrows= 300000, stringsAsFactors=FALSE)
  ##read first 400000 rows of data into R
data2 <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
  ## subset dates
png(file="plot1.png",width=480,height=480) ##create file to save png of histogram
hist(data2$Global_active_power, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)")
  ##create the histogram
dev.off() ##disconnect from the graphics device