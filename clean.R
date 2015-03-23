# load packages
library(data.table)
library(dplyr)
library(ggplot2)
library(lubridate)
library(ggmap)

# load data (csvs from https://www.its-rde.net/showdf?dataSetNumber=10146)
data <- fread('BusLocations_Oct.csv')
loc <- fread('BusStops.csv')

#subset data
subset <- data %>%
  select(route = ServiceRoute, 
         dir = Dir, 
         BusStopId, 
         date = Date, 
         schedule = ScheduledArrival, 
         arrival = EstimatedArrival) 

# add time variables and join bus stop lat/long
clean <- subset %>%
  mutate(date = ymd(date),
         ontime = period_to_seconds(hms(arrival)-hms(schedule))) %>%
  group_by(route, dir, BusStopId) %>%
  summarise(mean_ontime=mean(ontime, na.rm=T)/60,
            var_ontime=var(ontime, na.rm=T)/60) %>%
  inner_join(loc) %>%
  select(-BegDate, -EndDate) %>%
  as.data.frame()

# write to csv
write.csv(clean, 'shiny_apc.csv', row.names=F)
