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


## Use this to load latest surf dataframe
surf <- read.csv("surf3_w6cols.csv")

## function ft_to_inch w argument x being a vector of heights 
## feet and inches, in the format f'i" with f = number of feet, i = inches

ft_to_inch <- function(x) {
    ## create vector of surf heights
    hts_ft <- x
    
    ## load library for str_split_fixed() 
    library(stringr)
    ## remove " quotation mark from the end of the variable
    hts_ft2 <- str_split_fixed(hts_ft, "\"", 2)[, 1]
    
    ## split hts_ft into a data frame w variables for ft and inches 
    hts_ft_and_inches <- as.data.frame(str_split_fixed(hts_ft2, "'", 2))
    names(hts_ft_and_inches) <- c("ft", "inches")
    
    hts_ft_and_inches[, 1] <- as.numeric(levels(hts_ft_and_inches[, 1]))[hts_ft_and_inches[, 1]]
    hts_ft_and_inches[, 2] <- as.numeric(levels(hts_ft_and_inches[, 2]))[hts_ft_and_inches[, 2]]
    
    inches <- 12 * hts_ft_and_inches$ft + hts_ft_and_inches$inches
    cms <- 2.54 * inches
    
    print(cms)
}

