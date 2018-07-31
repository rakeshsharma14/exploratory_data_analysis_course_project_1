household <- read.table(file = "./household_power_consumption.txt", header = T, sep = ";")
head(household)
names(household)
names(household) <- tolower(names(household))
names(household)

dim(household)
head(household)

household$date <- as.Date(household$date, format = "%d/%m/%Y")

# Subset the data
data <- subset(household, date == "2007-02-01" | date == "2007-02-02")
head(data)

# Convert dates and times
data$datetime <- strptime(paste(data$date, data$time), "%Y-%m-%d %H:%M:%S")

head(data)

# Plot 2
data$datetime <- as.POSIXct(data$datetime)

plot(datetime, global_active_power, data = data, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.copy(png, file = "plot2.png")
dev.off()
