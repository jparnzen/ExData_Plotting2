# 4. Across the United States, how have emissions from coal combustion-related
# sources changed from 1999–2008?

merged_dt <- merge(NEI, SCC, by = "SCC", sort = F)
coal_dt <- merged_dt[grepl("coal", EI.Sector, ignore.case = T)]
coal_dt$coal.source <- sapply(coal_dt$EI.Sector,
                              function(x) unlist(strsplit(as.character(x), " - "))[2])

png("plot4.png", width = 640, height = 480)
p.coal <- ggplot(coal_dt, aes(year, Emissions / 1e3))
p.coal + geom_bar(stat = "identity") + 
    facet_grid(. ~ coal.source, margins = T) + 
    labs(title = "Coal Combustion Source PM2.5 Emissions by Year",
         x = "Years per coal combustion source",
         y = "Total PM2.5 emissions (thousand tons)")
dev.off()
