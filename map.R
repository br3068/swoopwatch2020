library(leaflet)
library(magrittr)
library(rgdal)
library(htmlwidgets)

birds <- readOGR('SWOOPING_BIRD.geojson')
swoops <- data.frame(birds@coords, birds$SWOOP_LOCATION)
colnames(swoops) <- c('lng','lat', 'location')

m <- leaflet() %>% setView(lng = 144.9629706, lat = -37.8148707, zoom = 10) 
m %>% addTiles() %>% addMarkers(lat = swoops$lat, lng = swoops$lng, label = swoops$location, clusterOptions = markerClusterOptions())

#work in progress -> saveWidget(m, file = "swoopwatchdraft.html", selfcontained = FALSE, libdir = 'swoopfiles', title = 'Swoopwatch')