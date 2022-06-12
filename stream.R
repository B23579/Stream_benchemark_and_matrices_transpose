setwd("D:/University of Trieste/project/Stream_benchemark_and_matrices_transpose")
library(tidyverse)
library(tibble)


st00<-read.csv("result/stream00 - Copy.csv", header = FALSE,sep=";") 
st00%>%rename(numb_thread=V1, triad=V2)-> st00
st00$numb_thread<- as.numeric(st00$numb_thread)
st00$triad<- as.numeric(st00$triad)

st01<-read.csv("result/stream01 - Copy.csv", header = FALSE,sep=";") 
st01%>%rename(numb_thread=V1, triad=V2)-> st01
st01$numb_thread<- as.numeric(st01$numb_thread)
st01$triad<- as.numeric(st01$triad)

st10<-read.csv("result/stream10 - Copy.csv", header = FALSE,sep=";") 
st10%>%rename(numb_thread=V1, triad=V2)-> st10
st10$numb_thread<- as.numeric(st10$numb_thread)
st10$triad<- as.numeric(st10$triad)

n<-nrow(st10)

level <-rep("mem node 00",n)
st00<- mutate(st00,map=level)
level <-rep("mem node 01",n)
st01<- mutate(st01,map=level)
level <-rep("mem node 10",n)
st10<- mutate(st10,map=level)


result <- rbind(st00,st01,st10)
result$map <-as.factor(result$map)
result$map<-as.factor(result$map)


p<-ggplot(result)+
  geom_point(mapping = aes(x=numb_thread,y=triad, color=map))+
  geom_line(mapping = aes(x=numb_thread,y=triad,color=map)) +
  labs(x="Nunber of thread", y= "Rate(Mb/s)", title = "STREAM-TRIAD Rate")+
  theme(plot.title = element_text(hjust = 0.5))
p 
ggsave(p, filename = "plot/stream.png")
