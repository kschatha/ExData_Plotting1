##R code to generate the plot3
temp <- tempfile( )
download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp)

fileName <- unz( temp, "household_power_consumption.txt")
data <- read.table(fileName, sep=";", header=TRUE, 
                   stringsAsFactors=FALSE, na.strings="?")
unlink(temp)
data$Date <- as.Date( data$Date, format="%d/%m/%Y")

data.new <- subset( data, Date == "2007-02-01" | Date == "2007-02-02")

data.new$DateTime <- strptime(paste(data.new$Date,data.new$Time), 
                              format="%Y-%m-%d %H:%M:%S")

png( file="plot3.png", width=480, height=480)
x <- data.new$DateTime
u <- data.new$Sub_metering_1
v <- data.new$Sub_metering_2
w <- data.new$Sub_metering_3
with(data.new, plot( x, u, type="l", xlab="", ylab="Energy sub metering"))
with( data.new, lines( x, v, col ="red"))
with( data.new, lines( x, w, col="blue"))
legend( "topright", lty=1, col = c("black", "blue", "red"),
        legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()