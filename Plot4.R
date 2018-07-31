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
household$global_active_power <- as.numeric(household$global_active_power)

household$global_reactive_power <- as.numeric(household$global_reactive_power)
household$voltage <- as.numeric(household$voltage)



head(household)

household$date <- as.Date(household$date, format = "%d/%m/%Y")
head(household)

# Subset the data
data <- subset(household, subset = (date == "2007-02-01" | date == "2007-02-02"))
head(data)

# Convert dates and times
data$datetime <- strptime(paste(data$date, data$time), "%Y-%m-%d %H:%M:%S")

head(data)

par(mfrow = c(2, 2))
plot(datetime, global_active_power, data = data, ylab = "Global Active Power", type = "l")
plot(datetime, voltage, data = data, ylab = "Voltage", type = "l")

plot(datetime, sub_metering_1, ylab = "Energy sub metering", type = "l")
lines(datetime, sub_metering_2, col = "red", type = "l")
lines(datetime, sub_metering_3, col = "blue", type = "l")
legend("topright", c("sub_metering_1", "sub_metering_2", "sub_metering_3"), lty = 1, lwd = 2.5, col = c("black", "red", "blue"))

plot(datetime, global_reactive_power, ylab = "Global Reactive Power", type = "l")

dev.copy(png, file = "plot4.png")
dev.off()
