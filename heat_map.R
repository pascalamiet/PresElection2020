# US Heat Map

library(tidyverse)
library(maps)

setwd("~/Documents/01_Bachelor Thesis/Empirics")


# By state ----------------------------------------------------------------


df <- read_csv('data_clean/ele_results_state.csv')
df$region <- tolower(df$state)

states <- map_data("state")
map.df <- merge(states,df, by="region", all.df=T)
map.df <- map.df[order(map.df$order),]
map.df$change <- map.df$change_dem_1620 * 100
ggplot(map.df, aes(x=long,y=lat,group=group))+
  geom_polygon(aes(fill=change))+
  geom_path()+ 
  scale_fill_gradientn(colours=c('red','white','blue'),na.value="grey90",limits=c(-10,10))+
  #scale_fill_gradientn(colours=rev(heat.colors(2)),na.value="grey90",limits=c(-10,10))+
  #scale_colour_gradientn(colours = c("red",'white', "blue"),breaks = c(-1,0,10)) +
  coord_map()



# By county ---------------------------------------------------------------


dfc <- read_csv('data_clean/results_covid_county.csv')
dfc <- within(dfc, unique <- paste(tolower(dfc$state),tolower(dfc$county),sep='_'))

for (i in 1:nrow(dfc)) {
  if(endsWith(dfc$unique[i],'county')) {
    temp = dfc$unique[i] 
    temp = substr(temp,1,nchar(temp)-7)
    dfc$unique[i] = temp
  } else {
    print(i)
  }
}

counties <- map_data("county")
counties <- within(counties, unique <- paste(tolower(counties$region),tolower(counties$subregion),sep='_'))
map.dfc <- merge(counties,dfc, by="unique", all.dfc=T)
map.dfc <- map.dfc[order(map.dfc$order),]

for (i in 1:nrow(map.dfc)) {
  if (map.dfc$change[i]>10) {
    map.dfc$change[i] = 10
  }
  else if (map.dfc$change[i]< -10) {
    map.dfc$change[i] = -10
  }
  else {
    print(i)
  }
}


pdf('data_clean/change_map.pdf')
ggplot(map.dfc, aes(x=long,y=lat,group=group))+
  theme_void() + #theme(legend.position="none") +
  geom_polygon(aes(fill=change))+
  geom_path()+ 
  scale_fill_gradientn(colours=c('red','white','blue'),na.value="grey90",limits=c(-10,10))+
  #scale_fill_gradientn(colours=rev(heat.colors(2)),na.value="grey90",limits=c(-10,10))+
  #scale_colour_gradientn(colours = c("red",'white', "blue"),breaks = c(-1,0,10)) +
  coord_map()
dev.off()




