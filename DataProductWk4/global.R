#global.R
#Objects defined here will be available to both server.R and ui.R
#
#

#Loading libraries
library(quanteda) #where we get the inauguration addresses
library(tm) #NLP
library(magrittr) #so code look beautiful
<<<<<<< HEAD
#
#' Prepare data (a quanteda large corpus) for word cloud
#'
#' @param inaug 
#'
#' @return a large tm::SimpleCorpus where the content has been made lower case,
#' punctuation removed,number and stopped word (SMART) removed. 
#' @export
#'
#' @examples
=======

>>>>>>> d44057df6dc5a2c85e7968dad48f272325a96c9b
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
<<<<<<< HEAD
#' Prepare a list of inaugural addresses by year and president
#'
#' @param inaug 
#'
#' @return a list of str (YYYY-President)
#' @export
#'
#' @examples
listMyAddresses <- function(inaug){
        myPrez <- paste0(inaug$documents$Year,"-",inaug$documents$President)
        myPrez
}

#' Calculate the Term Document Matrix for a corpus and sort it from most frequent term to less frequent.
#'
#' @param inaug 
#'
#' @return a TDM matrix with terms and frequency of terms
#' @export
#'
#' @examples
addressesTDM <- function(inaug){
        inaugTDM <- as.matrix(TermDocumentMatrix(inaug,control =list(minWordLength = 1)))
        inaugTDM <- sort(rowSums(inaugTDM),decreasing =TRUE)
        inaugTDM
}
#' Return an sepcific inaugural address
#'
#' @param address #a presidential address reference is the format YYYY-President (e.g: 2009-Obama)  
#' @param addressList #A list of adresses reference in the format YYYY-President
#' @param inaug  #a corpus containing inaugural addresses
#'
#' @return
#' @export
#'
#' @examples
getMyAddress <- function(address,addressList,inaug){
        ind <- match(address,addressList)
        inaug[ind]
}

inaugAddresses <<- listMyAddresses(data_corpus_inaugural)
=======
getMyPresidents <- function(inaug){
        myPrez <- paste0(inaug$documents$Year,"-",inaug$documents$President)
        myPrez
}
prez <<- getMyPresidents(data_corpus_inaugural)
>>>>>>> d44057df6dc5a2c85e7968dad48f272325a96c9b
inaugCorp <<- loadInaugData(data_corpus_inaugural)
