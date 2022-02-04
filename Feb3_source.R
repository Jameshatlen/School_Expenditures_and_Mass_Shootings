leaflet() %>%
addProviderTiles("CartoDB.Positron") %>%
setView(-98.483330, 38.712046, zoom = 3.5) %>%
addPolygons(data = state_w_expenditures_na_num ,
fillColor = ~fillcolor_expenditures(state_w_expenditures_na_num$X2015),
fillOpacity = 1,
stroke=TRUE,
weight = .2,
color = "#8f29ac",
smoothFactor = 0.2,
highlight = highlightOptions(
weight = 5,
color = "#555",
fillOpacity = 0.8,
bringToFront = FALSE),
label = ~popup_2015_names,
labelOptions = labelOptions(
style = list("font-weight" = "normal", padding = "3px 8px"),
textsize = "15px",
direction = "auto"),
group = "2015")  %>%
addPolygons(data = state_w_expenditures_na_num ,
fillColor = ~fillcolor_expenditures(state_w_expenditures_na_num$X2016),
fillOpacity = 1,
stroke=FALSE,
weight = 0.2,
smoothFactor = 0.2,
label = ~popup_2016_names ,
group = "2016")  %>%
addCircleMarkers(lng = shooting_df_2014_replaced[173:237,"Longitude"] ,
lat = shooting_df_2014_replaced[173:237,"Latitude"],
radius = 2,
label = shooting_df_2014_replaced[173:237,"Title"],
color = "#651689",
group = "2015") %>%
addCircleMarkers(lng = shooting_df_2016_lon ,
lat = shooting_df_2016_lat,
radius = 2,
popup = shooting_df_2016_title,
color = "#000000",
group = "2016") %>%
addLayersControl(baseGroups = c("2015","2016")) %>%
addLegend(pal = fillcolor_expenditures,
values = state_w_expenditures_na_num$X2016,
position = "bottomleft",
title = "Expenditures",
group = "2016")


#above is latest
#html doesnt work for labels, only popups (not fixed yet)

leaflet() %>%
addProviderTiles("CartoDB.Positron") %>%
setView(-98.483330, 38.712046, zoom = 3.5) %>%
addPolygons(data = state_w_expenditures_na_num ,
fillColor = ~fillcolor_expenditures(state_w_expenditures_na_num$X2015),
fillOpacity = 1,
stroke= FALSE,
weight = .5,
color = "#8f29ac",
smoothFactor = 0,
highlight = highlightOptions(
weight = 2,
color = "#b600e3",
fillOpacity = 0.4,
bringToFront = FALSE),
label = ~popup_2015_names,
labelOptions = labelOptions(
style = list("font-weight" = "normal", padding = "3px 8px"),
textsize = "15px",
direction = "auto"),
group = "2015")  %>%
addPolygons(data = state_w_expenditures_na_num ,
fillColor = ~fillcolor_expenditures(state_w_expenditures_na_num$X2016),
fillOpacity = 1,
stroke=FALSE,
weight = 0,
smoothFactor = 0,
highlight = highlightOptions(
weight = 2,
color = "#b600e3",
fillOpacity = 0.4,
bringToFront = FALSE),
label = ~popup_2016_names,
labelOptions = labelOptions(
style = list("font-weight" = "normal", padding = "3px 8px"),
textsize = "15px",
direction = "auto"),
group = "2016")  %>%
addCircleMarkers(lng = shooting_df_2014_replaced[173:237,"Longitude"] ,
lat = shooting_df_2014_replaced[173:237,"Latitude"],
radius = 2,
label = shooting_df_2014_replaced[173:237,"Title"],
color = "#000000",
opacity = 1,
group = "2015") %>%
addCircleMarkers(lng = shooting_df_2016_lon ,
lat = shooting_df_2016_lat,
radius = 2,
popup = shooting_df_2016_title,
color = "#000000",
opacity = 1,
group = "2016") %>%
addLayersControl(baseGroups = c("2015","2016"),
options = layersControlOptions(collapsed = FALSE)) %>%
addLegend(pal = fillcolor_expenditures,
values = state_w_expenditures_na_num$X2016,
labFormat = labelFormat(prefix = "$"),
position = "bottomleft",
title = "Expenditures per Pupil",
group = "2016")


#above needs floating labels fixed, and legend fixed, perhaps by removing na items
#fixing labels:
#https://www.r-graph-gallery.com/183-choropleth-map-with-leaflet.html
#https://rstudio.github.io/leaflet/choropleths.html

#title addition possile:
#https://marcinstepniak.eu/post/interactive-choropleth-maps-with-r-and-tmap-part-i/