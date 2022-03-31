####
#WORD CLOUD
####
install.packages("textreadr")
install.packages("tm")
install.packages("wordcloud2")
install.packages("googleVis")


library(textreadr)
dat <- read_transcript("CFDC_ID#_013.docx") #change the name of the document
dat <- subset(dat, Person == "P")
dat.Corpus<-Corpus(VectorSource(dat$Dialogue))
dat.Clean<-tm_map(dat.Corpus,removeNumbers)
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
?wordcloud2

####
#WORD TREE
####

dat.tree<-data.frame(removePunctuation(dat[,2]))
names(dat.tree) <- 'V1'

library(googleVis)
gw<-gvisWordTree(
  data = dat.tree,
  textvar = "V1",
  options = list(wordtree = "{word: 'patience'}", maxFontSize = 14))
plot(gw)



