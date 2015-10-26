# 2. Have total emissions from PM2.5 decreased in the **Baltimore City**, 
# Maryland (`fips == "24510"`) from 1999 to 2008? Use the **base** plotting 
# system to make a plot answering this question.

balt_fips <- "24510"
balt_emissions <- sapply(years, function(y) NEI[NEI$year == y & NEI$fips == balt_fips, sum(Emissions)])
balt_samples <- sapply(years, function(y) NEI[NEI$year == y & NEI$fips == balt_fips, .N])

message("Plotting...")
png("plot2.png", width = 640, height = 480)
curr_mfrow <- par("mfrow")
curr_oma <- par("oma")
par(mfrow = c(1,2), oma = c(0, 0, 2, 0))
barplot(balt_emissions, names.arg = years, xlab = "Years", ylab = "Total PM2.5 emissions (in tons)")
plot(years, balt_emissions, type = "b", xlab = "Years", ylab = "Total PM2.5 emissions (in tons)")
mtext("Total Baltimore City PM2.5 Emissions by Year", outer = T)
par(mfrow = curr_mfrow, oma = curr_oma)
dev.off()
