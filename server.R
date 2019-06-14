library(shiny)

source("nxtWord.R")

shinyServer(
  function(input, output) {
    output$sentence <- renderPrint({input$sentence})
    output$prediction <- renderPrint({nxtWord(input$sentence)[1]})
    output$status <- renderPrint({nxtWord(input$sentence)[2]})
  }
)

