## Creating a histogram of provided data

## reading in the data from a txt file

full_data <- read.table("household_power_consumption.txt", header=TRUE, sep=";",
                na.strings = "?", colClasses = c('character','character',
                                                 'numeric','numeric','numeric',
                                                 'numeric','numeric','numeric',
                                                 'numeric'))

## formatting dates to type date

full_data$Date <- as.Date(full_data$Date, "%d/%m/%Y")

## subset data from two days, Feb-1-2007 and feb-2-2007

full_data <- subset(full_data, Date >= as.Date("2007-2-1") 
                    & Date <= as.Date("2007-2-2"))

## remove incomplete cases

full_data <- full_data[complete.cases(full_data),]

## Combine Date and Time column
dateTime <- paste(t$Date, t$Time)

## Name the vector
dateTime <- setNames(dateTime, "DateTime")

## Remove Date and Time column
full_data <- full_data[ ,!(names(full_data) %in% c("Date","Time"))]

## Add DateTime column
full_data <- cbind(dateTime, t)

## Format dateTime Column
full_data$dateTime <- as.POSIXct(dateTime)


hist(full_data$Global_active_power, main="Global Active Power",
     xlab = "Global Active Power (kilowatts)", col="red")
