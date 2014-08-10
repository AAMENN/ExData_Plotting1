## The dataset is manually downloaded into a zip file and the text file is extracted to household_power_consumption.txt.
## The household_power_consumption.txt file is read using fread() and the data is stored into powerdata. Only the required subset of data is read 
## to enhance the speed of reading of data. Subsetting is done by manually calculating the number of rows and columns.
library(data.table);
powerdata<-fread("/home/amann/R/household_power_consumption.txt",sep=";",skip=66637,nrows=69517-66637);

## Powerdata is given a proper column names.
colnames(powerdata)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3");

## Plot(histogram) is created as Global_active_power as x-axis and its frequency. Plot is pictured in plot1.png file.
with(powerdata,hist(Global_active_power,main="Global Active Power",xlab="Global Active Power(kilowatts)",col='red',bg='transparent'));
