library(textreadr)
dat <- read_transcript("CFDC_ID#_013.docx")
dat <- subset(dat, Person == "P")
dat.Corpus<-Corpus(VectorSource(dat$Dialogue))
dat.Clean<-tm_map(dat.Clean,removeNumbers)
dat.Clean<-tm_map(dat.Clean,removeWords,stopwords("english"))
dat.Clean<-tm_map(dat.Clean,removePunctuation)
dat.Clean<-tm_map(dat.Clean,stripWhitespace)

dtm <- TermDocumentMatrix(dat.Clean) 
matrix <- as.matrix(dtm) 
words <- sort(rowSums(matrix),decreasing=TRUE) 
df <- data.frame(word = names(words),freq=words)

library(wordcloud2)
wordcloud2(data=df)
head(df)
wordcloud2(data=df[-c(2),], size=1.6)


#####
within(dat)
dat.tree<-data.frame(removePunctuation(dat$Dialogue))
dat.tree<-data.frame(removeNumbers(dat.tree$removePunctuation.dat.Dialogue.))
dat.tree<-data.frame(removeWords(dat.tree$removeNumbers.dat.tree.removePunctuation.dat.Dialogue.., stopwords("english")))
dat.tree<-data.frame(stripWhitespace(dat.tree$removeWords.dat.tree.removeNumbers.dat.tree.removePunctuation.dat.Dialogue....))

library(googleVis)
gw<-gvisWordTree(
  data = dat.tree,
  textvar = "removePunctuation.dat.Dialogue.")
plot(gw)

wt1 <- gvisWordTree(Cats, textvar = "Phrase")
plot(wt1)


