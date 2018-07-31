household <- read.table(file = "./household_power_consumption.txt", header = T, sep = ";", stringsAsFactors = F)
head(household)
names(household)
names(household) <- tolower(names(household))
names(household)

dim(household)
head(household)


household$sub_metering_1 <- as.numeric(household$sub_metering_1)
household$sub_metering_2 <- as.numeric(household$sub_metering_2)
household$sub_metering_3 <- as.numeric(household$sub_metering_3)

head(household)

household$date <- as.Date(household$date, format = "%d/%m/%Y")
head(household)

# Subset the data
data <- subset(household, subset = (date == "2007-02-01" | date == "2007-02-02"))
head(data)

# Convert dates and times
data$datetime <- strptime(paste(data$date, data$time), "%Y-%m-%d %H:%M:%S")

head(data)

# Plot 2
# data$datetime <- as.POSIXct(data$datetime)

plot(datetime, sub_metering_1, data = data, type="l", xlab="", ylab="Energy sub metering", ylim = c(0, 30))
lines(datetime, sub_metering_2, data = data, type="l", col="red")
lines(datetime, sub_metering_3, data = data, type="l", col="blue")
legend("topright", c("sub_metering_1", "sub_metering_2", "sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
# axis(side=2,at=seq(0,30,10))

dev.copy(png, file = "plot3.png")
dev.off()
