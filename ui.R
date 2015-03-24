shinyUI(fluidPage(

  titlePanel("APC Data Viewer"),

  sidebarLayout(
    sidebarPanel(
    
      selectizeInput(inputId = 'Route', 
                     label = 'Route',
                     choices = levels(data$route)),
      
      checkboxGroupInput("Direction", label = ("Direction"), 
                         choices = c(Inbound = 'IN',
                                     Outbound = 'OUT'),
                         selected = c('IN','OUT'))
    ),

    mainPanel(
      plotOutput('plot', height = "500px", width = "600px")
    )
  )
))

