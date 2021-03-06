rm(list = ls(all=TRUE))
library(leaflet)
library(magrittr)
data <- read.csv("test_ubike.csv")
options(digits=8)


map <- leaflet() %>%
  addMarkers(lng=data$result.records.lng[1:504],lat=data$result.records.lat[1:504]) %>%
  addTiles() 
map
