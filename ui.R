
library(shiny)
library(leaflet)

cities <- c("Athens", "Barcelona", "Brussels", "Calais", "Cherbourg", "Cologne", "Copenhagen", "Geneva",
            "Gibraltar", "Hamburg", "Hook of Holland", "Lisbon", "Lyons", "Madrid", "Marseilles",
            "Milan", "Munich", "Paris", "Rome", "Stockholm", "Vienna")

# Define UI for application that draws a bar plot giving the ETA to each destinations
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Calculate your travel time!"),
  
  h3("This little tool will give the time needed to go from one city to another. 
     Select your starting city, your speed and you will get the time you will need to get to the other main cities of Europe ! "),
  
  # Sidebar with a select and numeric input to select trip and speed
  sidebarLayout(
    sidebarPanel(
      selectInput("startCityInput", "Select your starting city:", cities),
      numericInput("speedInput", "Select the speed at which you will drive (or fly!) in km/h: ", min = 10, value = 130),
      submitButton("Submit")
    ),
    
    
    # Show the time of travel by cities on a bar plot
    mainPanel(
      plotOutput("timePlot")
    )
  )
))
