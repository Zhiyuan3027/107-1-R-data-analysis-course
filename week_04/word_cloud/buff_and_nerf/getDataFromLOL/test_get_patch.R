rm(list=ls(all.names = TRUE))
library(tmcn)
library(rvest)
library(magrittr)
#install.packages("tmcn", 
#repos="http://R-Forge.R-project.org")
URL   = "https://na.leagueoflegends.com/en/news/game-updates/patch"
html  = read_html(URL)

#ref: https://rpubs.com/SatoshiLiang/159348
#'.' stands for class, '#' stands for id
title = html_nodes(html, ".default-2-3 a")
href  = html_attr(title, "href")
data = data.frame(title = html_text(title),
                  href = href)
getContent <- function(x) {
  url  = paste0("https://na.leagueoflegends.com", x)
  tag  = html_node(read_html(url), 'div#patch-notes-container')
  text = html_text(tag)
}

#getContent(data$href[1])
#cannot get patch because of the strange structure of the LOL website
allText = sapply(data$href, getContent)
allText
write.table(allText, "mydata.txt")
