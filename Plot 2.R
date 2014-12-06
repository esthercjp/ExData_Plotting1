# Read in all the data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";",
                   stringsAsFactors=FALSE, na.strings=c("?"))

# Subset only the two days of data that is needed
ndata <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]

# Create a new column with the combined date and time
ndata$datetime <- mapply(function(s1, s2){as.POSIXct(paste(s1, s2), format = "%d/%m/%Y %H:%M:%S")},
                         ndata$Date,ndata$Time)
# Create Plot 2
png("plot2.png")
plot(ndata$datetime, ndata$Global_active_power, type="l", xaxt = "n",
     ylab = "Global Active Power (kilowatts)", xlab = "")
axis.POSIXct(1, as.POSIXct(ndata$datetime, origin="1970-01-01"))
dev.off()
