# download the data from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# and place the unzipped file (household_power_consumption.txt) in your working directory #

# Read in all the data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";",
                   stringsAsFactors=FALSE, na.strings=c("?"))

# Subset only the two days of data that is needed
ndata <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]

# Create Plot1 
png("plot1.png")
hist(ndata$Global_active_power, 
     xlab = "Global Active Power (kilowatts)",ylab="Frequency",
     main = "Global Active Power",
     col = "red")
dev.off()