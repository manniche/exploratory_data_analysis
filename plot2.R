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
png("plot2.png")

plot(time, data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

dev.off()
