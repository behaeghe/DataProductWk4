#global.R
#Objects defined here will be available to both server.R and ui.R
#
#

#Loading libraries
library(quanteda) #where we get the inauguration addresses
library(tm) #NLP
library(magrittr) #so code look beautiful

loadInaugData <- function(inaug){ #Inaug is a tm::Corpus
#Getting our data
inaugCorp <- Corpus(VectorSource(inaug$documents$texts))
#Let's clean up a bit
inaugCorp <- inaugCorp %>% 
        tm_map(content_transformer(tolower)) %>%
        tm_map(removePunctuation) %>%
        tm_map(removeNumbers) %>% 
        tm_map(removeWords,stopwords("SMART"))
inaugCorp
}
getMyPresidents <- function(inaug){
        myPrez <- paste0(inaug$documents$Year,"-",inaug$documents$President)
        myPrez
}
prez <<- getMyPresidents(data_corpus_inaugural)
inaugCorp <<- loadInaugData(data_corpus_inaugural)
