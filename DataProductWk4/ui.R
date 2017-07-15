#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(wordcloud)
<<<<<<< HEAD
# TODO:
# App Flow:     select an address from address list
#               locate address (call getMyaddress)
#               Calculate TDM for the speific address
#               Update the wordcloud
# UI:  sidebar allow for number of address to compare
#      Create as many tag clouds
#      each tag cloud has a drop down to select the address
#      Minimal frequency should be set ?
=======

>>>>>>> d44057df6dc5a2c85e7968dad48f272325a96c9b
# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Comparing Inaugural Addresses"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
          sidebarPanel(
                  selectInput("selection", "Choose a president of the United States:",
                              choices = inaugAddresses),
                  #actionButton("update", "Change"),
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
