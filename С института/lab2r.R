require(rvest)
require(tm)
a = "https://xkcd.com/"
b = paste(a,"1495",sep="")
br = read_html(b)
res <- html_attr(html_node(br, "#comic img"), "src")
res = paste("https:",res,sep="")
res
a = "https://nukadeti.ru/skazki/kasha_iz_topora"
ar = read_html(a)
res1 = as.character(html_text(html_node(ar, "div.tale-text.si-text")))
b = "https://nukadeti.ru/skazki/masha_i_medved"
br = read_html(b)
res2 = as.character(html_text(html_node(br, "div.tale-text.si-text")))
c = "https://nukadeti.ru/skazki/kolobok"
cr = read_html(c)
res3= as.character(html_text(html_node(cr, "div.tale-text.si-text")))
res = paste(res1,res2,res3)
res = gsub("\r\n","",res)
res = gsub("[^а-яА-Яё]"," ",res)
res = gsub("  "," ",res)
res = data.frame(strsplit(as.character(res)," "))
names(res)[1] <- "text"
res_title <- data.frame(doc_id=row.names(res), 
                        text=res$text)
corpus <- Corpus(DataframeSource(res_title))
corpus <- tm_map(corpus, tolower)
corpus <- tm_map(corpus, function(x) removeWords(x, stopwords("russian")))
corpus <- tm_map(corpus, function(x) removeWords(x, "ка"))
tdm <- TermDocumentMatrix(corpus,control = list(minWordLength = 1))
m <- as.matrix(tdm)
v <- sort(rowSums(m),decreasing=TRUE)
df <- data.frame(word = names(v),freq=v)
require(RColorBrewer)
require(wordcloud)
pal2 <- brewer.pal(8,"RdYlGn")
wordcloud(df$word,df$freq, scale=c(3.5,0.25),min.freq=3,
          max.words=100, random.order=FALSE, rot.per=.15, colors=pal2)

