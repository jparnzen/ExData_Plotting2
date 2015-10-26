# 5. How have emissions from motor vehicle sources changed from 1999–2008 
# in **Baltimore City**?

balt_merged <- merge(balt_NEI, SCC, by = "SCC", sort = F)
balt_mobile <- subset(balt_merged, grepl("mobile", SCC.Level.One, ignore.case = T))
balt_vehicles <- subset(balt_mobile, grepl("vehicle", SCC.Level.Two, ignore.case = T))

png("plot5.png", width = 640, height = 480)
p <- ggplot(balt_vehicles, aes(year, Emissions))
p + geom_bar(stat = "identity") +
    labs(title = "Baltimore City Motor Vehicle PM2.5 Emissions by Year",
         x = "Years",
         y = "Total PM2.5 emissions (tons)")
dev.off()
