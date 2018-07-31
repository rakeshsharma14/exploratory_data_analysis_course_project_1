

household <- read.table(file = "./household_power_consumption.txt", header = T, sep = ";")

household$date <- as.Date(household$date, "%d/%m/%Y")

household$time <- strptime(household$time, "%H:%M:%S")

head(household)

filtered <- household[household$date == "2007-02-01" | household$date == "2007-02-02", ]

transformed <- filtered

transformed$global_active_power <- as.numeric(levels(transformed$global_active_power))[transformed$global_active_power]


hist(transformed$global_active_power, 
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

dev.copy(png, "plot1.png")
dev.off()
