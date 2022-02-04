library(leaflet)
library(dbplyr)
library(colorspace)
library(htmltools)
library(maps)

#fillcolor_expenditures  is a colornumeric object
#plasma is from the veridis package I think
#range is determined by the 2015 and 2016 ranges
#for the most color change between values
#~ I forgot the use of but it works (same for popup)
#fillcolor_expenditures <- colorNumeric("plasma", domain=6500:22000 , reverse = TRUE)
#fillColor = ~fillcolor_expenditures(state_w_expenditures_na_num$X2015)
#argument is the vector of data to fill color according to
#variable is called pal in online tutorial:
##https://learn.r-journalism.com/en/mapping/census_maps/census-maps/

#these objects are the data for the popup labels of the states
#popup_sb <- paste0("Total: ", as.character(states_merged_sb$total))
#example from:
#https://learn.r-journalism.com/en/mapping/census_maps/census-maps/
#my own are:
#popup_2016 <- paste0("$", as.character(state_w_expenditures$X2016))
#popup_2015 <- paste0("$", as.character(state_w_expenditures$X2015))
#popup_2015_names <- paste0(as.character(state_w_expenditures_na_num$NAME),": $", as.character(state_w_expenditures_na_num$X2015))


leaflet() %>%
addProviderTiles("CartoDB.Positron") %>%
setView(-98.483330, 38.712046, zoom = 4) %>%
addPolygons(data = state_w_expenditures_na_num , 
            fillColor = ~fillcolor_expenditures(state_w_expenditures_na_num$X2015), 
            fillOpacity = 1,
            stroke=FALSE, 
            weight = 0.2, 
            smoothFactor = 0.2, 
            popup = ~popup_2015 , 
            group = "2015")  %>%
addPolygons(data = state_w_expenditures_na_num , 
            fillColor = ~fillcolor_expenditures(state_w_expenditures_na_num$X2016), 
            fillOpacity = 1,
            stroke=FALSE, 
            weight = 0.2, 
            smoothFactor = 0.2, 
            popup = ~popup_2016 , 
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
                 label = shooting_df_2016_title, 
                 color = "#000000", 
                 group = "2016") %>%
addLayersControl(baseGroups = c("2015","2016"))

