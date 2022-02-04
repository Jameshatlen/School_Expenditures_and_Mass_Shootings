#below is the finished map as of Feb 4.
#possible next steps:
#-figure out how to create a tmap title if possible without starting 
#a tmap from scratch
#-using shiny to add features and graphs
#-finding a better dataset on shootings or make a csv file from the 
#-complete wikipedia mass shootings list
#(this data set have very few shootings for all the years it claims 
#to cover besides 2015 and 2016)
#finding some more interesting state and location data
#use graphs show correlation (shiny to display)

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
  addCircleMarkers(lng = shooting_df_2015_lon_row173_237 ,
                   lat = shooting_df_2015_lat_row173_237,
                   radius = 2,
                   popup = shooting_df_2015_title_row173_237,
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
            title = "Expenditures",
            group = "2016")



#below is feb 3 evening
#below needs floating labels fixed, and legend fixed, perhaps by removing na items
#fixing labels:
#https://www.r-graph-gallery.com/183-choropleth-map-with-leaflet.html
#https://rstudio.github.io/leaflet/choropleths.html
#oddly the labels these use don't work, unsure why.
#legend fix would be the same, didn't work

#title addition possile:
#https://marcinstepniak.eu/post/interactive-choropleth-maps-with-r-and-tmap-part-i/
#this is with tmap, and did not work. Would need more tmap experience

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
addCircleMarkers(lng = shooting_df_2015_lon_row173_237 ,
lat = shooting_df_2015_lat_row173_237,
radius = 2,
label = shooting_df_2015_title_row173_237,
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


