#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
source("./global.R")

shinyServer <- function(input, output) {
        output$add1 <- renderText(input$add1)
        output$add2 <- renderText(input$add2)
                address <- reactive({
                                        cloudTerms <- isolate(
                        withProgress({
                                setProgress(message="Generating Word Cloud...")
                                AddressesTDM(getMyAddress(input$add1,myPrez,inaugCorp))
                        }))
                })
        output$cloud1 <- renderPlot({
         myterms <- address()
         wordcloud(names(myterms),
                   myterms,
                   scale(4,0.5), 
                   min.freq = 4,
                   max.words =10,
                   colors=brewer.pal(8,"Blues"))
        })                    
}
