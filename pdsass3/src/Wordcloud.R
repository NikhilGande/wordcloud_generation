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
Data<- read.csv("/Users/nikhilgande/Documents/pdsass3/data_clean/Corona_NLP_test.csv")
print(Data)


# Tokenization(converting text to tokens) and performing stop word removal
tokens <- Data %>%
  unnest_tokens(word, OriginalTweet) %>% anti_join(get_stopwords(),by="word")



print(tokens)

#counting word frequencies


freq <- tokens %>%
  count(word, sort = TRUE)


#word_freq<-tokens
print(freq)

#creating word cloud 
png("/Users/nikhilgande/Documents/pdsass3/results/wordcloud.png", width = 800, height = 800, units = "px")
wordcloud(words = freq$word, freq = freq$n, min.freq = 1,
          max.words = 200, random.order = FALSE, rot.per = 0.35,
          colors = brewer.pal(8, "Dark2"))
dev.off()






