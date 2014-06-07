##R code to generate the plot4
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

png( file="plot4.png", width=480, height=480)
par( mfrow=c(2,2))

x1 <- data.new$DateTime
y1 <- data.new$Global_active_power
plot(x1,y1, type="l", xlab="", ylab="Global Active Power")

x2 <- data.new$DateTime
y2 <- data.new$Voltage
plot( x2, y2, type="l", xlab="datetime", ylab="Voltage")

x3 <- data.new$DateTime
u <- data.new$Sub_metering_1
v <- data.new$Sub_metering_2
w <- data.new$Sub_metering_3
with(data.new, plot( x3, u, type="l", xlab="", ylab="Energy sub metering"))
with( data.new, lines( x3, v, col ="red"))
with( data.new, lines( x3, w, col="blue"))
legend( "topright", lty=1, col = c("black", "blue", "red"),
        legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

x4 <- data.new$DateTime
y4 <- data.new$Global_reactive_power
plot( x4, y4, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off( )