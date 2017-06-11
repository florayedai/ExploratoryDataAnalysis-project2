# Exploratory Data Analysis 
# Project2: plot2.R

library(dplyr)

NEI <- readRDS("summarySCC_PM25.rds")

baltimore <- summarise(group_by(subset(NEI, fips == "24510"), year), totalEmissions = sum(Emissions))

# plot it into png
png(filename = "plot2.png", width = 480, height = 480, units = 'px')        
with(baltimore, barplot(totalEmissions, 
                            names = year,
                            xlab  = "year", 
                            ylab  = expression("Total PM"[2.5]*" Emissions in ton"),
                            ylim  = c(0,4000),
                            main  = expression("Total PM"[2.5]*" Emissions in Baltimore"), 
                            col   = c("red", "green", "blue", "purple")))
dev.off()
