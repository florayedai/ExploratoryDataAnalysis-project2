# Exploratory Data Analysis 
# Project2: plot6.R

library(dplyr)
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltimore  <- summarise(group_by(subset(NEI, fips == "24510" & type == 'ON-ROAD'), year), totalEmissions = sum(Emissions))
baltimore$location <- "Baltimore"

LosAngeles <- summarise(group_by(subset(NEI, fips == "06037" & type == 'ON-ROAD'), year), totalEmissions = sum(Emissions))
LosAngeles$location <- "Los Angeles"

emissionData <- rbind(baltimore, LosAngeles)

g <- ggplot(emissionData, aes(x = year, y = totalEmissions, fill = location))
g <- g + facet_grid(.~location) 
g <- g + geom_bar(position="dodge", stat = "identity", width = 0.5) 
g <- g + ggtitle(expression("Emissions from motor vehicle sources in Baltimore and Los Angeles")) 
g <- g + labs(x = "year") + labs(y = expression("Total PM"[2.5]*" Emissions in ton"))

png(filename = "plot6.png", width = 600, height = 480, units = 'px')        
print(g)
dev.off()
