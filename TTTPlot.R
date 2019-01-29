#R code for Shiny app for Test and Treatment Threshold Plot (TTT PLot)#
#Janet Bouttell, Neil Hawkins and Dmitry Ponomarev#

library(shiny)

#slider input is odds ratio only - then need to plot this for set values of sens and spec#
sens <- c(0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1)
spec <- c(0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1)

odds <- 0.31
#this input will come from a slider#

x <- (1-spec/odds) 
y <- ((1-spec)/odds)
TTT <- if(odds >=1) x else y


ui<- fluidPage(
  sliderInput(inputId = "odds", label = "Set at odds ratio A to B", min = 0.1, max = 5, value = 0.1)
  )
plotOutput(outputId = "TTTPlot")

server <- function(input, output){
  output$TTTPlot <- renderPlot({input$odds})
}
  

shinyApp(ui, server)

