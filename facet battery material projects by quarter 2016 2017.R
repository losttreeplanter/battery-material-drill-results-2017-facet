
###########This is facet of total data set on Glen's Dril Report, email 3/12/2018. Chart style of Plotting background data for groups with ggplot2 based on https://drsimonj.svbtle.com/plotting-background-data-for-groups-with-ggplot2

library(tidyverse)


library(readr)



BatteryDrillResultsQ <- read_csv("C:/Users/mmccrae/Downloads/Battery materials projects Mar 2018 by quarter.csv")

BatteryDrillResultsQ$Quarter <- factor(BatteryDrillResultsQ$Quarter, levels=c("Q1 2016","Q2 2016","Q3 2016","Q4 2016","Q1 2017","Q2 2017","Q3 2017","Q4 2017"))




BatteryNarrowQ <-BatteryDrillResultsQ %>% gather(PropertyType, NumberOfProjects, Nickel:TotalProperties) %>% #narrow data frame
  filter(PropertyType!="TotalProperties")


BatteryJustTotalQ <-BatteryDrillResultsQ %>% gather(PropertyType, NumberOfProjects, Nickel:TotalProperties) %>% #narrow data frame 
  filter(PropertyType=="TotalProperties")





BatteryJustTotalQ2 <-BatteryJustTotalQ[,-2] #create dataframe for totals that exclude property type




ggplot(BatteryNarrowQ, aes(x = Quarter, y = NumberOfProjects)) +
  geom_bar(data=BatteryJustTotalQ2, fill="grey", alpha=0.5, stat="identity") +
  geom_bar(aes(fill=PropertyType), stat="identity") +
  geom_text(aes(label=NumberOfProjects)) +
  facet_wrap(~PropertyType) +
  scale_x_discrete(breaks = c("Q1 2016", "Q3 2016", "Q1 2017", "Q3 2017")) +
  theme_bw()              # for clean look overall