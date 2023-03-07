full_data <- read.table("household_power_consumption.txt", header=TRUE, sep=";",
                        na.strings = "?", colClasses = c('character','character',
                                                         'numeric','numeric','numeric',
                                                         'numeric','numeric','numeric',
                                                         'numeric'))

full_data$Date <- as.Date(full_data$Date, "%d/%m/%Y")
full_data <- subset(full_data, Date >= as.Date("2007-2-1") 
                    & Date <= as.Date("2007-2-2"))
full_data <- full_data[complete.cases(full_data),]
dateTime <- paste(t$Date, t$Time)
dateTime <- setNames(dateTime, "DateTime")
full_data <- full_data[ ,!(names(full_data) %in% c("Date","Time"))]
full_data <- cbind(dateTime, t)
full_data$dateTime <- as.POSIXct(dateTime)
hist(full_data$Global_active_power, main="Global Active Power",
     xlab = "Global Active Power (kilowatts)", col="red")

### PLOT 2

plot(full_data$Global_active_power~full_data$dateTime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

     