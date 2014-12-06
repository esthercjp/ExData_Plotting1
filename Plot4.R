#Read in data downloaded and placed in working directory
electricpowerdat <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings=c("?"))

#Subset data to reflect the two dates
subsetdat <- electricpowerdat[electricpowerdat$Date == "1/2/2007"|electricpowerdat$Date=="2/2/2007",]

#Create a new column with the combined date and time
subsetdat$datetime <- mapply(function(s1, s2){as.POSIXct(paste(s1, s2), format="%d/%m/%Y %H:%M:%S")}, subsetdat$Date, subsetdat$Time)

#Recreate plot4
png("plot4.png")
par(mfcol=c(2,2))

plot(subsetdat$datetime, subsetdat$Global_active_power, type="l", xaxt="n", ylab="Global Active Power", xlab="")
axis.POSIXct(1, as.POSIXct(subsetdat$datetime, origin="1970-01-01"))

plot(subsetdat$datetime, subsetdat$Sub_metering_1, type="l", xaxt="n", ylab="Energy sub metering", xlab="")
lines(subsetdat$datetime, subsetdat$Sub_metering_2, col="red")
lines(subsetdat$datetime, subsetdat$Sub_metering_3, col="blue")
axis.POSIXct(1, as.POSIXct(subsetdat$datetime, origin="1970-01-01"))
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n")

plot(subsetdat$datetime, subsetdat$Voltage, type="l", xaxt="n", ylab="Voltage", xlab="datetime")
axis.POSIXct(1, as.POSIXct(subsetdat$datetime, origin="1970-01-01"))

plot(subsetdat$datetime, subsetdat$Global_reactive_power, type="l", xaxt="n", ylab="Global_reactive_power", xlab="datetime")
axis.POSIXct(1, as.POSIXct(subsetdat$datetime, origin="1970-01-01"))
dev.off()

