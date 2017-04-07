library(shiny)
library(datasets)

# Define page type for Shiny application
shinyUI(fluidPage(
  
  #  Application title
  titlePanel("Average Heights and Weights for American Women"),
  
  # Provide Height and Weight Input 
  sidebarPanel(
    numericInput("inches", "Height (in inches)", 60, min = 58, max = 72)
  ),
    
    # Show the result
    mainPanel(
      plotOutput("plot1"),
      h3('The average weight of an American women with the indicated height is:'),
      textOutput("result"))
  )
)

