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

# TODO:
# App Flow:     select an address from address list
#               locate address (call getMyaddress)
#               Calculate TDM for the speific address
#               Update the wordcloud
# UI:  sidebar allow for number of address to compare
#      Create as many tag clouds
#      each tag cloud has a drop down to select the address
#      Minimal frequency should be set ?
#=======


# Define UI for application that draws a histogram
shinyUI(fluidPage(
        fluidRow(
                column(12,
                       h1("Comparing Inaugural Addresses")
                        )
                ),
        fluidRow(
                column(5,
                       textOutput("add1"),
                       selectInput("add1","Select Inaugural Address",prez),
                       plotOutput("cloud1")
                       ),
                column(2, h4("vs")),
                column(5,
                       textOutput("add2"),
                       selectInput("add2","select Inaugural Address",prez),
                       plotOutput("cloud2")
                )
        )  
    )
  )

