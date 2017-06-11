# Exploratory Data Analysis 
# Project2: plot5.R

library(dplyr)
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

motorVehicle  <- summarise(group_by(subset(NEI, fips == "24510" & type == 'ON-ROAD'), year), totalEmissions = sum(Emissions))

g <- ggplot(motorVehicle, aes(x = year, y = totalEmissions, fill = year))
g <- g + geom_bar(position="dodge", stat = "identity", width = 0.5) 
g <- g + ggtitle(expression("Total emissions from motor vehicle in Baltimore City")) 
g <- g + labs(x = "year") + labs(y = expression("Total PM"[2.5]*" Emissions in ton"))

png(filename = "plot5.png", width = 600, height = 480, units = 'px')        
print(g)
dev.off()

