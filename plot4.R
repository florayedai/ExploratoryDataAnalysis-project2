# Exploratory Data Analysis 
# Project2: plot4.R

library(dplyr)
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

coalSCC = SCC[grepl("coal", SCC$Short.Name, ignore.case=TRUE), "SCC"]
coalNEI <- NEI[NEI$SCC %in% coalSCC, ]

coalEmission <- summarise(group_by(coalNEI, year), totalEmissions = sum(Emissions))

g <- ggplot(coalEmission, aes(x = factor(year), y = totalEmissions, fill = year))
g <- g + geom_bar(position="dodge", stat = "identity", width = 0.5) 
g <- g + ggtitle(expression("Total PM"[2.5]*" Emissions from coal")) 
g <- g + labs(x = "year") + labs(y = expression("Total PM"[2.5]*" Emissions from coal in ton"))

png(filename = "plot4.png", width = 600, height = 480, units = 'px')        
print(g)
dev.off()

