setwd("BodyDims/intermediatefiles/")

surf <- read.csv("top34names.csv")

## install ggplot
install.packages('ggplot2')
library(ggplot2)

## create df giving count of surfers from each country
surfcountrycount <- data.frame(table(surf$country))
names(surfcountrycount) <- c("country", "count")

## qplot histogram by country using surf dataframe
qplot(data = surf, x = country) +
    scale_y_continuous(limits = c(0, 13), breaks = seq(0, 13, 1))

## ggplot using new dataframe with counts of each country
p1 <- ggplot(surfcountrycount, aes(x = country, y = count)) +
    geom_bar(stat = "identity")

## ggplot by descenting order using new dataframe with counts of each country
p2 <- ggplot(surfcountrycount, aes(x = reorder(country, -count), y = count)) +
    geom_bar(stat = "identity")

## create variable cual method showing how the surfer qualified for 2015 wsl
qualmethod <- c(rep("CT", times = 22), rep("QS", times = 10), rep("wildcard", times = 2))
surf <- cbind(surf, qualmethod)

# Write to "surf2_w3cols.csv"
write.csv(surf, file = "surf2_w3cols.csv", row.names = FALSE)

## copy and paste height and weight info from WCT website http://www.worldsurfleague.com/athletes/tour/mct to excel 
## and save as "surf3_w6cols.csv"

surf <- read.csv("surf3_w6cols.csv")

