library(shiny)

shinyUI(fluidPage(
  titlePanel("StockPrices"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Select a stock to examine. 
        Information will be collected from yahoo finance."),
    
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
                  selected = "line"),
      
      helpText("The stockPrices app looks up stock prices by ticker symbol and 
displays the results as a line chart."),
      helpText("The app lets you:"),
      helpText("1. Select a stock to examine"),
      helpText("2. Pick a range of dates to review"),
      helpText("3. Choose whether to plot stock prices or the log of the 
stock prices on the y axis"),
      helpText("4. Decide whether or not to correct prices for inflation"),
      helpText("5. Choose which type of graph to display (line, candlestick, 
matchstick or bars)."),
      helpText("By default, it is displayed the SPY ticker (an index of the 
entire S & P 500)."),
      helpText("To look up a different stock, type in a stock symbol that Yahoo 
finance will recognize."), 
      helpText("You can find a list of Yahoo’s stock symbols here:"),
      helpText("http://finance.yahoo.com/lookup"),
      helpText("Some common symbols are GOOG (Google), AAPL (Apple), 
GS (Goldman Sachs) and CSCO (Cisco).")
    ),
    
    mainPanel(plotOutput("plot"))
  )
))