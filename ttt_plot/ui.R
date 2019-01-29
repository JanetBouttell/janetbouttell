#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
   # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      p("Choose an odds ratio beteen 0.1 and 10 on the ratio scale"),
       sliderInput("odds_ratio",
                   "Enter the desired odds ratio",
                   min = 0.1,
                   max = 10,
                   value = 1)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
        # Start with some text
      h1("Janet's first shiny app"),
      p("This app shows how to convert an odds ratio into ..."),
      plotOutput("plot1"),
      tableOutput("mytable")
    )
  )
))
