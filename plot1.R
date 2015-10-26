# 1. Have total emissions from PM2.5 decreased in the United States from 1999 
# to 2008? Using the **base** plotting system, make a plot showing the *total* 
# PM2.5 emission from all sources for each of the years 1999, 2002, 2005, 
# and 2008.

require(data.table)
require(dplyr)
require(graphics)
require(grDevices)

message("Reading NEI & SCC into data tables...")
NEI <- as.data.table(readRDS("summarySCC_PM25.rds"))
SCC <- as.data.table(readRDS("Source_Classification_Code.rds"))

message("Factorizing data table columns...")
NEI$year <- as.factor(NEI$year)
NEI$type <- as.factor(NEI$type)
NEI$Pollutant <- as.factor(NEI$Pollutant)
NEI$SCC <- as.factor(NEI$SCC)
NEI$fips <- as.factor(NEI$fips)

years <- levels(NEI$year)
total_emissions <- sapply(years, 
                    function(y) NEI[year == y, sum(Emissions)])
total_samples <- sapply(years, function(x) NEI[NEI$year == x, .N])

message("Plotting...")
png("plot1.png", width = 640, height = 480)
curr_mfrow <- par("mfrow")
curr_oma <- par("oma")
par(mfrow = c(1,2), oma = c(0, 0, 2, 0))
barplot(height = total_emissions / 1e6, names.arg = years, xlab = "Years", ylab = "Total PM2.5 emissions (in million tons)")
plot(years, total_emissions / 1e6, type = "b", xlab = "Years", ylab = "Total PM2.5 emissions (in million tons)")
mtext("Total PM2.5 emissions by year", outer = T)
par(mfrow = curr_mfrow, oma = curr_oma)
dev.off()
