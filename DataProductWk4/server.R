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
        wordcloud_rep <- repeatable(wordcloud)
        output$cloud1 <- renderPlot({
                input$add1
                myaddr <- input$add1
                addr <- getMyAddress(myaddr,prez,inaugCorp)
                TDM <- addressesTDM(addr)
                wordcloud_rep(names(TDM),
                          TDM,
                          min.freq=3,
                          colors=brewer.pal(8,"Blues"))
                }) 
        output$cloud2 <- renderPlot({
                input$add2
                myaddr <- input$add2
                addr <- getMyAddress(myaddr,prez,inaugCorp)
                TDM <- addressesTDM(addr)
                wordcloud_rep(names(TDM),
                          TDM,
                          min.freq=3,
                          colors=brewer.pal(8,"Blues"))
        }) 
        
}
