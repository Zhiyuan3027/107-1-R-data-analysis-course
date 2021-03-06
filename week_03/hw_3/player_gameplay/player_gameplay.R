library(ggplot2)
mydata = read.csv("../lcs-2017-summer-split-fantasy-player-team-stats/LCS Players Stats Summer Split 2017.csv")

#turn numeric into character
mydata$Name = as.character(mydata$Name)
mydata$Team = as.character(mydata$Team)

#find the data which is not blank and store into getData
getnnonameID = which(nchar(mydata$Name) != 0) 
getData = mydata[getnnonameID,]

#create a vector storing all team names
#https://stat.ethz.ch/R-manual/R-devel/library/base/html/append.html
#how to append value to vector (the website above)
all.team.name <- getData$Team[1]
i <- 2
repeat{
  if( is.na(getData$Team[i]) ) break
  if( !(getData$Team[i] %in% all.team.name) ) {
    all.team.name <- append(all.team.name, getData$Team[i], length(all.team.name))
  }
  i <- i + 1
}

#plot the data of player in team (one by one)
#http://www.sthda.com/english/articles/24-ggpubr-publication-ready-plots/81-ggplot2-easy-way-to-mix-multiple-graphs-on-the-same-page/

#if(!require(devtools)) install.packages("devtools")
#devtools::install_github("kassambara/ggpubr")
#use above two lines to install package

#failed
library(magrittr)
library(ggpubr)
graph <- ggplot(data = getData, aes(x = Name, y = Game.Played, fill = Team)) + geom_bar(stat = "identity") + facet_wrap(~Team)
graph
