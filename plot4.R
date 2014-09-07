require(sqldf)
library(Defaults)
sql_stmt <- paste( "select * from file where Date = '1/2/2007' or Date = '2/2/2007'" )
data <- read.csv.sql( file='../data/pwr_cons/household_power_consumption.txt',
                      sep=";",
                      sql=sql_stmt,
                      header=TRUE
)
png("plot4.png")

par(mfrow = c(2,2))

plot(time, data$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")

plot(time, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(time, data$Sub_metering_1, type = "l", col = "black", ylab = "Energy sub metering", xlab = "")

lines(time, data$Sub_metering_2, col = "red")

lines(time, data$Sub_metering_3, col = "blue")

legend("topright", lty = 0, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(time, data$Global_reactive_power, type = "l", xlab = "datetime", ylab='Global_Active_Power')

dev.off()
