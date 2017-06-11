# Exploratory Data Analysis 
# Project2: plot3.R

library(dplyr)
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")

baltimore <- summarise(group_by(subset(NEI, fips == "24510"), type, year), totalEmission = sum(Emissions))
baltimore$type <- factor(baltimore$type, levels=c("ON-ROAD", "NON-ROAD", "POINT", "NONPOINT"))  

g <- ggplot(baltimore, aes(x = year, y = totalEmission, fill = type))
g <- g + geom_bar(position="dodge", stat = "identity", width = 1.0) + facet_grid(.~type) 
g <- g + ggtitle(expression("Total PM"[2.5]*" Emissions in Baltimore by type")) 
g <- g + labs(x = "year") + labs(y = expression("Total PM"[2.5]*" Emissions in ton"))

png(filename = "plot3.png", width = 600, height = 480, units = 'px')        
print(g)
dev.off()



