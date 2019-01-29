#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)
library(ggplot2)

mydf <- tibble(spec = c(0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1))

# Define server logic required to create plot
shinyServer(function(input, output) {
   
  
  mydf_react <- reactive({
     ## Get desired odds ratio
    odds_ratio <- input$odds_ratio
    ## Conditionally calculate the sensitivity based on the level of the odds ratio
    if(odds_ratio >=1) {
      res <- (1-mydf$spec/odds_ratio) } else {
      res <-  ((1-mydf$spec)/odds_ratio)
      }
    ## Combine the calcualted result in the dataframe with the original specificity
    mydf <- mydf %>% 
    mutate(sens = res)
  })

  output$plot1 <- renderPlot({
  # Draw the plot
  plot1 <- ggplot(mydf_react(), aes(x = spec, y = sens)) +
    geom_smooth(se = FALSE, method = "lm") +
    scale_x_continuous("Specificity", limits = c(0,1)) +
    scale_y_continuous("Sensitivity", limits = c(0,1))
  
  ## Return the plot
  return(plot1)
  })
  output$mytable <- renderTable({
    mydf_react()
  })
})
