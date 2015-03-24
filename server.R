shinyServer(function(input, output) {
  
  dat <- reactive({
    data[data$route == input$Route &
         data$dir == input$Direction ,]
})

  output$plot <- renderPlot({
    
    mylocation <- c(min(dat()$Lon), min(dat()$Lat), max(dat()$Lon), max(dat()$Lat))
    
    myMap <- get_map(location=mylocation,
                     source="stamen", maptype="toner", crop=F)
    
    ggmap(myMap, extent = 'device') +
      geom_point(aes(x=Lon, y=Lat, color=mean_ontime, size=3), data=dat()) +
      scale_color_gradient(low = "#00FFFFFF", high = "#FF0000FF") +
      theme(legend.position = 'bottom') 

  })
 
})
