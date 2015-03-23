#global
#load libraries, read in data, perform any needed data cleaning/manipulation here
#both server.r and ui.r can read it
#only server.r reads the data
#but if you want to specify all levels of a factor in ui.R, then it can read it from here
#no need to specifiy them one at a time
library(shiny)
library(data.table)
library(dplyr)
library(ggmap)
library(ggplot2)

data <- fread('shiny_apc.csv')

data$route <- as.factor(data$route)


