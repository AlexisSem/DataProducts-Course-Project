#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(reshape2)

citiesDistances <- melt(as.matrix(eurodist), varnames = c("origin", "destination"))
citiesDistances$origin <- as.character(citiesDistances$origin)
citiesDistances$destination <- as.character(citiesDistances$destination)


# Define server logic required to calculate time needed and display leaflet
shinyServer(function(input, output) {
   
  output$timePlot <- renderPlot({
    
    # generate bins based on input$bins from ui.R
    timeByCities <- reactive({
      citiesDistances[which(citiesDistances$origin == input$startCityInput &
                              citiesDistances$destination != input$startCityInput), ][, 2:3]
    })
    
    timeByCitiesOrdered <- timeByCities()[order(timeByCities()$value), ]
    par(mar=c(5, 8, 5, 3))
    barplot(height = timeByCitiesOrdered$value / input$speedInput,
            names.arg = timeByCitiesOrdered$destination,
            horiz = TRUE,
            xlab = "Time Needed in hours",
            main = "Time to destination by cities",
            las = 1,
            )
    
  })
  
  
})
