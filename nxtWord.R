library(dplyr)
library(stringr)

# read bigrams, trigrams & quadgrams
bigram <- readRDS("bigram_small.RDS")
trigram <- readRDS("trigram_small.RDS")
quadgram <- readRDS("quadgram_small.RDS")

nxtWord <- function(sentence) {
  sentence <- str_squish(tolower(sentence))
  words <- unlist(strsplit(sentence, " "))
  len <- length(words)
  predWord <- ""
  status <- "ok, prediction found"
  
  if (len > 2) {
    words <- data.table::shift(words, len-3, type = "lead")
    predWord <- quadgram %>%
	  filter(word1 == words[1]) %>%
      filter(word2 == words[2]) %>%
      filter(word3 == words[3]) %>%
      filter(freq == max(freq)) %>%
      select(word4)
    if (dim(predWord)[1] == 0) {
      len <- 2
      words <- data.table::shift(words, 1L, type = "lead")
    } else {
      if (dim(predWord)[1] > 0) predWord <- predWord[sample(dim(predWord)[1], 1), 1]
    }
  }
  
  if (len == 2) {
    predWord <-trigram %>%
      filter(word1 == words[1]) %>%
      filter(word2 == words[2]) %>%
      filter(freq == max(freq)) %>%
      select(word3)
    if (dim(predWord)[1] == 0) {
      len <- 1
      words <- data.table::shift(words, 1L, type = "lead")
    } else {
      if (dim(predWord)[1] > 0) predWord <- predWord[sample(dim(predWord)[1], 1), 1]
    }
  }
  
  
  if (len == 1) {
    predWord <-bigram %>%
      filter(word1 == words[1]) %>%
      filter(freq == max(freq)) %>%
      select(word2)
    if (dim(predWord)[1] < 1) {
      status <- "no prediction found"
      predWord <- ""
    } else {
      predWord <- predWord[sample(dim(predWord)[1], 1), 1]
    }
  }
  
  if (len == 0) status <- "empty string; no prediction"
  
  c(str_squish(paste(sentence, predWord)), status)
}

