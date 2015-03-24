#global
#load libraries, read in data, perform any needed data cleaning/manipulation here

library(shiny)
library(data.table)
library(dplyr)
library(ggmap)
library(ggplot2)

data <- fread('shiny_apc.csv')

data$route <- as.factor(data$route)


