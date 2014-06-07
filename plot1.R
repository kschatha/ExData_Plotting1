##R code to generate the plot1

temp <- tempfile( )
download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp)

fileName <- unz( temp, "household_power_consumption.txt")
data <- read.table(fileName, sep=";", header=TRUE, 
                   stringsAsFactors=FALSE, na.strings="?")
unlink(temp)
data$Date <- as.Date( data$Date, format="%d/%m/%Y")
data.new <- subset( data, Date == "2007-02-01" | Date == "2007-02-02")

png( file="plot1.png", width=480, height=480)
hist( data.new$Global_active_power, col="red", 
      main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()