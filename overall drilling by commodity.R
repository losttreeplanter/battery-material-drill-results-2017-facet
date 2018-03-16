library(tidyverse)
library(scales)


commodity <- c("Gold","Copper","Nickel","Zinc","Lithium","Cobalt","Graphite","Molybdenum","Palladium","Platinum","Silver","Uranium")
projects <- c(483,197,30,120,33,50,5,12,12,12,198,8)

projectsq4 <- tibble(commodity, projects)


projectsq4$commodity <- factor(projectsq4$commodity, levels = projectsq4$commodity[order(projectsq4$projects)])

color_stuff <- c('#8dd3c7','#ffffb3','#bebada','#fb8072','#80b1d3','#fdb462','#b3de69','#fccde5','#d9d9d9','#bc80bd','#ccebc5','#ffed6f')

color_stuff2 <- c('lightblue','lightgray','lightgray','lightgray','lightgray','lightblue','lightblue','lightblue','lightgray','lightgray','lightgray','lightgray')


ggplot(projectsq4, aes(commodity, projects))+
  geom_col(aes(fill=commodity)) +
  scale_fill_manual(values=color_stuff2) +
  coord_flip() +
  geom_text(label=projects, hjust=-.3)+
  guides(fill=FALSE) +
  theme_minimal()
  


