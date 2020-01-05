## Read Data
fileName <- "exdata_data_household_power_consumption.zip"
unzip(fileName)

dataset <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors= F)

dataset$Date <- as.Date(dataset$Date, format = "%d/%m/%Y")

startDate <- as.Date("2007-02-01", format = "%Y-%m-%d")

endDate <- as.Date("2007-02-02", format = "%Y-%m-%d")

dataset <- dataset[dataset$Date %in% c(startDate, endDate), ]

dataset$Global_active_power <- as.numeric(dataset$Global_active_power)

dataset$Time <- as.POSIXct(paste(dataset$Date,dataset$Time), format="%Y-%m-%d %H:%M:%S")

## Creating Graph

png(file = "plot3.png")

with(dataset, plot(x=Time, y=Sub_metering_1, na.strings = "?", type="l", ylab="Energy sub metering"))

with(dataset, lines(x=Time, y=Sub_metering_2, na.strings = "?", type="l", col="Red"))

with(dataset, lines(x=Time, y=Sub_metering_3, na.strings = "?", type="l", col="Blue"))

legend("topright", lty=1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
