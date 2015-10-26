# 3. Of the four types of sources indicated by the `type` (point, nonpoint, 
# onroad, nonroad) variable, which of these four sources have seen decreases 
# in emissions from 1999–2008 for **Baltimore City**? Which have seen increases 
# in emissions from 1999–2008? Use the **ggplot2** plotting system to make a 
# plot answer this question.

require(ggplot2)

balt_NEI <- NEI[NEI$fips == balt_fips]

png("plot3.png", width = 640, height = 480)
p <- ggplot(balt_NEI)
p + geom_bar(aes(year, Emissions), stat = "identity") +
    facet_grid(. ~ type) +
    labs(title = "Baltimore City PM2.5 Emissions by Source Type by Year",
         x = "Years per source type",
         y = "Total PM2.5 emissions (in tons)")
dev.off()
