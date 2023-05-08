#installing required packages
install.packages("tidytext")
install.packages("dplyr")
install.packages("wordcloud")
install.packages("tm")
install.packages("ggplot2")

# Load required libraries
library(tidytext)
library(dplyr)
library(ggplot2)
library(tm)
library(wordcloud)
library(SnowballC)

#Loading data
Data<- read.csv("/Users/nikhilgande/Documents/pds3/Corona_NLP_test.csv")
print(Data)


# Tokenization(converting text to tokens)
tokens <- Data %>%
  unnest_tokens(word, OriginalTweet) %>% anti_join(get_stopwords(),by="word")

print(tokens)

tokens %>% count(UserName,word,sort="TRUE")

# performing stop word removal


tokens %>% wordcloud( min.freq = 1,max.words = 200, scale=c(8,1),random.color = TRUE)



