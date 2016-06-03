setwd('/Users/yunxiao/Documents/My Documents/Lab/My Thesis/template/metathesis-v2.0/data/epr')
library(ggplot2)
library(dplyr)

df <- read.csv("Protovec1T12h11m57sD11_29_2011.txt", header=FALSE)
df <- tbl_df(df)

colnames(df) = c('freq')
size <- length(df$freq)
df$freq <- df$freq/1000000
df$index <- c(1:size)

ggplot(df) +
  geom_line(aes(x=index, y=freq), color='blue', size=1) + 
  scale_y_continuous(breaks=seq(9.4, 9.5, 0.005)) +
  xlab('Counts') + 
  ylab('Zeeman Transition Frequency (MHz)') +
  theme_bw()