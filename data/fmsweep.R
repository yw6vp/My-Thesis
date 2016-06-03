setwd('/Users/yunxiao/Documents/My Documents/Lab/My Thesis/template/metathesis-v2.0/data')
library(ggplot2)
library(dplyr)

df <- read.table("Protovec1T16h09m29sD10_18_2011.txt", header = FALSE, sep="\t")
df <- tbl_df(df)
df <- t(df)
df <- data.frame(df)
rownames(df) <- NULL
colnames(df) <- c("freq","signal", "c", "d")
maxindex <- which(df[,2]==max(df[,2]))
minindex <- which(df[,2]==min(df[,2]))
f <- df[minindex:maxindex,1]
s <- df[minindex:maxindex,2]
fit <- lm(s~f)
fitted_s <- fit$fitted.values
df2 <- data.frame(f, fitted_s)
ggplot() +
  geom_point(data=df, aes(x=df[,1], y=df[,2])) +
  geom_line(data=df2, aes(x=f,y=fitted_s, color='red')) +
  xlab('f(kHz)') +
  ylab(expression(paste("Lockin Signal (", mu, "V)"))) +
  theme_bw()


