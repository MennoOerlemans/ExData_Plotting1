# Create plot 1 (Exploratory data analysis program assignment week 1)

Power_consumption <- read.table("~/R/Household/household_power_consumption.txt", header = TRUE, sep = ";", na.strings ="?", stringsAsFactors = FALSE, dec = ".")

Power_consumption <- Power_consumption[Power_consumption$Date %in% c("1/2/2007", "2/2/2007"), ]

Power_consumption <- mutate(Power_consumption, Global_active_power = as.numeric(Global_active_power ))

png(filename = "~/R/Household/Plot1.png", width = 480, height = 480)
par(mfrow = c(1,1))
hist(Power_consumption$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()