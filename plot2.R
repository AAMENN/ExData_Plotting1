## The dataset is manually downloaded into a zip file and the text file is extracted to household_power_consumption.txt.
## The household_power_consumption.txt file is read using fread() and the data is stored into powerdata. Only the required subset of data is read 
## to enhance the speed of reading of data. Subsetting is done by manually calculating the number of rows and columns.
library(data.table);
powerdata<-fread("/home/amann/R/household_power_consumption.txt",sep=";",skip=66637,nrows=69517-66637);

## Date and Time are converted to the standard format and stored into other list variables as date.
date<-strptime(paste(powerdata$Date,powerdata$Time),"%d/%m/%Y %H:%M:%S");

## Plot(lines) is created between date(x-axis) and Global Active Power(y-axis). Plot is pictured in a separate file "plot2.png".
plot(date,powerdata$Global_active_power,type="l",ylab="Global Active Power(kilowatts)",xlab="");
