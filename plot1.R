# Exploratory Data Analysis 
# Project2: plot1.R

library(dplyr)

NEI <- readRDS("summarySCC_PM25.rds")

emissionByYear <- summarise(group_by(NEI, year), totalEmissions = sum(Emissions))

# plot it into png
png(filename = "plot1.png", width = 480, height = 480, units = 'px')        
with(emissionByYear, barplot(totalEmissions/1000.0, names =year,
                            xlab = "year", 
                            ylab = expression("Total PM"[2.5]*" Emissions in Kilo Ton"),
                            ylim = c(0,8000),
                            main = expression("Total PM"[2.5]*" Emissions in USA"), 
                            col= c("red", "green", "blue", "purple")))
dev.off()
