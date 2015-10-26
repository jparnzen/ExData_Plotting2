# 6. Compare emissions from motor vehicle sources in **Baltimore City** with 
# emissions from motor vehicle sources in **Los Angeles County**, California 
# (`fips == "06037"`). Which city has seen greater changes over time in motor 
# vehicle emissions?

LA_fips <- "06037"
balt_LA_NEI <- NEI[fips == balt_fips | fips == LA_fips]
balt_LA_merged <- merge(balt_LA_NEI, SCC, by = "SCC", sort = F)
balt_LA_mobile <- subset(balt_LA_merged, grepl("mobile", SCC.Level.One, ignore.case = T))
balt_LA_vehicles <- subset(balt_LA_mobile, grepl("vehicle", SCC.Level.Two, ignore.case = T))
balt_LA_vehicles$fips.name <- ""
balt_LA_vehicles[fips == balt_fips]$fips.name <- "Baltimore City"
balt_LA_vehicles[fips == LA_fips]$fips.name <- "LA County"

png("plot6.png", width = 640, height = 480)
p <- ggplot(balt_LA_vehicles, aes(year, Emissions))
p + geom_bar(stat = "identity") + 
    facet_grid(. ~ fips.name) +
    labs(title = "Baltimore & LA Motor Vehicle PM2.5 Emissions",
         x = "Years per Location",
         y = "Total PM2.5 Emissions (tons)")
dev.off()
