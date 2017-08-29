# Create plot 2 (Exploratory data analysis program assignment week 1)
#Data preparation
Power_consumption <- read.table("~/R/Household/household_power_consumption.txt", header = TRUE, sep = ";", na.strings ="?", stringsAsFactors = FALSE, dec = ".")

Power_consumption <- subset(Power_consumption, Date %in% c("1/2/2007","2/2/2007"))
Power_consumption <- mutate(Power_consumption, Global_active_power = as.numeric(Global_active_power ))
Power_consumption$Date <- as.Date(Power_consumption$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(Power_consumption$Date), Power_consumption$Time)
Power_consumption$Datetime <- as.POSIXct(datetime)

## Plot 2
png(filename = "~/R/Household/Plot2.png", width = 480, height = 480 )
with(Power_consumption, {
  plot(Global_active_power~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
})

dev.off()