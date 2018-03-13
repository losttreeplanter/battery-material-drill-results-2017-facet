
###########This is facet of total data set on Glen's Dril Report, email 3/12/2018. Chart style of Plotting background data for groups with ggplot2 based on https://drsimonj.svbtle.com/plotting-background-data-for-groups-with-ggplot2

library(tidyverse)


library(readr)
TotalDrillResults <- read_csv("~/Copy of Drill Report Commodity Copmpilation 2016-2017.csv")

TotalDrillResults$Month <- factor(TotalDrillResults$Month, levels=c("Jan-16","Feb-16","Mar-16","Apr-16","May-16","Jun-16","Jul-16","Aug-16","Sep-16","Oct-16","Nov-16","Dec-16","Jan-17","Feb-17","Mar-17","Apr-17","May-17","Jun-17","Jul-17","Aug-17","Sep-17","Oct-17","Nov-17","Dec-17"))

Narrow <-TotalDrillResults %>% gather(PropertyType, NumberOfProjects, TotalProperties:UraniumPercentTotal) %>% 
  filter(!grepl('PercentTotal',PropertyType)) %>% 
  filter(PropertyType!="TotalProperties") 

JustTotal <-TotalDrillResults %>% gather(PropertyType, NumberOfProjects, TotalProperties:UraniumPercentTotal) %>% 
  filter(PropertyType=="TotalProperties") 



JustTotal2 <-JustTotal[,-2]



ggplot(Narrow, aes(x = Month, y = NumberOfProjects)) +
  geom_bar(data=JustTotal2, fill="grey", alpha=0.5, stat="identity") +
  geom_bar(stat="identity") +
  facet_wrap(~PropertyType) +
  scale_x_discrete(breaks = c("Jan-16", "Jul-16", "Jan-17", "Jul-17")) +
  theme_bw()              # for clean look overall