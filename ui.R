shinyUI(fluidPage(

  # Application title
  titlePanel("APC Data Viewer"),

  # Sidebar with a slider input for number of bins
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

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput('plot', height = "500px", width = "600px")
      #,
      #tableOutput("table")
    )
  )
))

