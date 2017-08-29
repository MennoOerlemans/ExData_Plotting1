# Create plot 3 (Exploratory data analysis program assignment week 1)
#Data preparation
Power_consumption <- read.table("~/R/Household/household_power_consumption.txt", header = TRUE, sep = ";", na.strings ="?", stringsAsFactors = FALSE, dec = ".")

Power_consumption <- subset(Power_consumption, Date %in% c("1/2/2007","2/2/2007"))
Power_consumption$Date <- as.Date(Power_consumption$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(Power_consumption$Date), Power_consumption$Time)
Power_consumption$Datetime <- as.POSIXct(datetime)
Power_consumption <- mutate(Power_consumption, Sub_metering_1 = as.numeric(Sub_metering_1))
Power_consumption <- mutate(Power_consumption, Sub_metering_2 = as.numeric(Sub_metering_2))

## Plot 3
png(filename = "~/R/Household/Plot3.png", width = 480, height = 480 )
with(Power_consumption, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime, col = "red")
  lines(Sub_metering_3~Datetime, col = "blue")
  
})

legend("topright", col=c("black", "red", "blue"), lty = 1, lwd = 2, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()