## The dataset is manually downloaded into a zip file and the text file is extracted to household_power_consumption.txt.
## The household_power_consumption.txt file is read using fread() and the data is stored into powerdata. Only the required subset of data is read 
## to enhance the speed of reading of data. Subsetting is done by manually calculating the number of rows and columns.
library(data.table);
powerdata<-fread("/home/amann/R/household_power_consumption.txt",sep=";",skip=66637,nrows=69517-66637);

## A graphic device is opened to avoid any resizing problem.
png(file="plot3.png");

## Plot is created for the largest range of the data.
plot(date,powerdata$Sub_metering_1,type="l",col='black',ylab="Energy Sub metering",xlab="");

## Other plots are added to the same plot in a different color for different variables.
lines(date,powerdata$Sub_metering_2,type="l",col='red');
lines(date,powerdata$Sub_metering_3,type="l",col="blue");

## Legends are added to the plot created to the topright corner. plot3.png file depicts the plot.
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=1,col=c("black","red","blue"))

##The graphic device is shut down.
dev.off();