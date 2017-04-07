library(shiny)
library(datasets)

shinyServer(function(input, output) {
  model <- lm(weight ~ height, data = women)
  
  modelpred <- reactive({
    inchesInput <- input$inches
    predict(model, newdata = data.frame(height = inchesInput))
  })  

  
    
  output$plot1 <- renderPlot({
  inchesInput <- input$inches
    
    plot(women$height, women$weight, main = "Average Heights and Weights of American Women", xlab = "Height", ylab = "Weight")
    points(inchesInput, modelpred(), col = "red")
  })   
  
    output$result <- renderText({
      modelpred()
  })
})

