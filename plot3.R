require(sqldf)
library(Defaults)
sql_stmt <- paste( "select * from file where Date = '1/2/2007' or Date = '2/2/2007'" )
data <- read.csv.sql( file='../data/pwr_cons/household_power_consumption.txt',
                      sep=";",
                      sql=sql_stmt,
                      header=TRUE
)

time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

data$time <- time
png("plot3.png")

plot(time, data$Sub_metering_1, type = "l", col = "black", ylab = "Energy sub metering", xlab = "")
lines(time, data$Sub_metering_2, col = "red")
lines(time, data$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
