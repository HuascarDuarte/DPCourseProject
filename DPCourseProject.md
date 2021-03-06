Developing Data Products Course Project
========================================================
author: Huascar Duarte
date: October, 26th 2014

Stock Prices Application
========================================================
The stockPrices app looks up stock prices by ticker symbol and displays the results as a line chart. The app lets you:
- Select a stock to examine, typing a stock symbol that Yahoo finance will recognize
- Pick a range of dates to review
- Choose whether to plot stock prices or the log of the stock prices on the y axis
- Decide whether or not to correct prices for inflation
- Choose which type of graph to display: line, candlestick, matchstick or bars
- By default, it is displayed the **SPY** ticker (an index of the entire S & P 500). 
Quantmod Package
========================================================

- Stock Prices app uses R’s **quantmod** package
- It is a Quantitative Financial Modelling and Trading Framework for R
- It uses two functions from the quantmod package:
    + `getSymbols`: to download financial data from websites like Yahoo finance
    + `chartSeries`: to display prices in an attractive chart.
- Itis also used an R script named `helpers.R` which contains a function that:
    + Adjusts stock prices for inflation
    + Retrieves company name from Yahoo

Example of Code
========================================================
Following code using `quantmod` package creates a plot from the prices of Apple's stock:

```r
library(quantmod)

prices<-getSymbols("AAPL", src = "yahoo", 
                   from = "2014-10-01", 
                   to = "2014-10-26",             
                   auto.assign = FALSE)

chartSeries(prices, theme = chartTheme("white"), 
            type = "candlestick",                   
            name = "Apple Inc.", 
            log.scale = FALSE, 
            TA = NULL)
```

![plot of chunk unnamed-chunk-1](DPCourseProject-figure/unnamed-chunk-1.png) 
Resulting Chart
========================================================
![plot of chunk unnamed-chunk-2](DPCourseProject-figure/unnamed-chunk-2.png) 
