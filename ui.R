library(shiny)

shinyUI(fluidPage(
  titlePanel("StockPrices"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Select a stock to examine. 
        Information will be collected from yahoo finance. 
        Some common symbols are GOOG (Google), AAPL (Apple), 
        GS (Goldman Sachs) or CSCO (Cisco)."),
    
      textInput("symb", "Symbol", "SPY"),
    
      dateRangeInput("dates", 
        "Date range",
        start = "2013-01-01", 
        end = as.character(Sys.Date())),
   
      actionButton("get", "Get Stock"),
      
      br(),
      br(),
      
      checkboxInput("log", "Plot y axis on log scale", 
        value = FALSE),
      
      checkboxInput("adjust", 
        "Adjust prices for inflation", value = FALSE),
      
      br(),
      
      selectInput("typeGraph", "Select type of graph", 
                  choices = list("Candlesticks" = "candlesticks", 
                                 "Matchsticks" = "matchsticks",
                                 "Bars" = "bars",
                                 "Line" = "line" ), 
                  selected = "line")
    ),
    
    mainPanel(plotOutput("plot"))
  )
))