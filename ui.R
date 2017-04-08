library(shiny)
library(datasets)

# Define page type for Shiny application
shinyUI(fluidPage(
  
  #  Application title
  titlePanel("Speed of Cars and the Distances Taken to Stop"),
  
  # Provide Height and Weight Input 
  sidebarPanel(
    numericInput("mph", "Speed of Car (in mph)", 20, min = 4, max = 25)
  ),
    
    # Show the result
    mainPanel(
      plotOutput("plot1"),
      h3('The distance (in feet) it takes for a car to stop with the indicated speed is:'),
      textOutput("result"))
  )
)

