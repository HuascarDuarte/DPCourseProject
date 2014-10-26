# server.R

library(quantmod)
source("helpers.R")

shinyServer(function(input, output) {
    
    dataInput <- reactive({  
        getSymbols(input$symb, src = "yahoo", #Runs function from quantmod library
                   from = input$dates[1],     #that gets stock prices from Yahoo
                   to = input$dates[2],
                   auto.assign = FALSE)
    })
    
    finalInput <- reactive({  
        if (!input$adjust) return(dataInput()) 
        adjust(dataInput()) #Runs function that adjusts stock price to inflation
    })
    
    output$plot <- renderPlot({ 
        chartSeries(finalInput(), 
                    theme = chartTheme("white"), 
                    type = input$typeGraph, 
                    name = compName(input$symb),
                    log.scale = input$log, 
                    TA = NULL)
    })
})
