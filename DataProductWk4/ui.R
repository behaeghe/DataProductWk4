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
  
  # Application title
  titlePanel(""),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
          sidebarPanel(
                  selectInput("selection", "Choose a president of the United States:",
                              choices = prez),
                  actionButton("update", "Change"),
                  hr(),
                  sliderInput("max",
                              "Maximum Number of Words:",
                              min = 1,  max = 30,  value = 15)
          ),
    
    # Show a plot of the generated distribution
    mainPanel(
       h1("hello")
    )
  )
))
