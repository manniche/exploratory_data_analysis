require(sqldf)
library(Defaults)
sql_stmt <- paste( "select * from file where Date = '1/2/2007' or Date = '2/2/2007'" )
data <- read.csv.sql( file='../data/pwr_cons/household_power_consumption.txt',
                      sep=";",
                      sql=sql_stmt,
                      header=TRUE
)
png("plot1.png")
hist(data$Global_active_power,col='red',main='Global Active Power',xlab='Global Active Power (kilowatts)')
dev.off()
