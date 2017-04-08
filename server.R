library(shiny)
library(datasets)

shinyServer(function(input, output) {
  model <- lm(dist ~ speed, data = cars)
  
  modelpred <- reactive({
    mphInput <- input$mph
    predict(model, newdata = data.frame(speed = mphInput))
  })  

  
    
  output$plot1 <- renderPlot({
  mphInput <- input$mph
    
    plot(cars$speed, cars$dist, xlab = "Speed", ylab = "Distance (in feet)")
    abline(lm(dist ~ speed, data = cars), col = "red")
    points(mphInput, modelpred(), col = "red", pch = 15)
  })   
  
    output$result <- renderText({
      modelpred()
  })
})

