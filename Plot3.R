# Read in all the data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";",
                   stringsAsFactors=FALSE, na.strings=c("?"))

# Below we only need data from two days
ndata <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]

# Create a new column with the combined date and time
ndata$datetime <- mapply(function(s1, s2){as.POSIXct(paste(s1, s2), format = "%d/%m/%Y %H:%M:%S")},
                         ndata$Date,ndata$Time)


png("plot3.png")
plot(ndata$datetime, ndata$Sub_metering_1, type="l", xaxt = "n",
     ylab = "Energy sub metering", xlab = "")
lines(ndata$datetime, ndata$Sub_metering_2, col = "red")
lines(ndata$datetime, ndata$Sub_metering_3, col = "blue")
axis.POSIXct(1, as.POSIXct(ndata$datetime, origin="1970-01-01"))
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
