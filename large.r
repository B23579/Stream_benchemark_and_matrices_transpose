setwd("D:/University of Trieste/project/Stream_benchemark_and_matrices_transpose")
library(tidyverse)
library(tibble)



largcol<-read.csv("result/large_col.csv", header = FALSE,sep=";") 
largcol%>%rename(Size=V1, Time=V2)-> largcol
largcol$Size<- as.numeric(largcol$Size)
largcol$Time<- as.numeric(largcol$Time)


largrow<-read.csv("result/large_row.csv", header = FALSE,sep=";") 
largrow%>%rename(Size=V1, Time=V2)-> largrow
largrow$Size<- as.numeric(largrow$Size)
largrow$Time<- as.numeric(largrow$Time)

largcol<-tibble(largcol)
largcol%>%group_by(Size)%>% 
  summarize(Walltime = mean(Time, ra.rm=TRUE), sd=sd(Time,na.rm = TRUE)) -> largcol

largrow<-tibble(largrow)
largrow %>%group_by(Size)%>% 
  summarize(Walltime = mean(Time, ra.rm=TRUE), sd=sd(Time,na.rm = TRUE)) -> largrow

n<-nrow(largcol)

coll = rep("column",n)
largcol<- mutate(largcol, run_by=coll)

n<-nrow(largrow)

coll = rep("row",n)
largrow<- mutate(largrow, run_by=coll)

view(largrow)

result <- rbind(largcol,largrow)
result$run_by<-as.factor(result$run_by)

p<-ggplot(result)+
  geom_point(mapping = aes(x=Size,y=Walltime, color=run_by))+
  geom_smooth(mapping = aes(x=Size,y=Walltime,color=run_by),se=FALSE) +
  labs(x="N", y= "Runtime(ms)", title = "Runtime as a function of matrix size NxN")+
  theme(plot.title = element_text(hjust = 0.5))+
  geom_errorbar(aes(x=Size, ymin=Walltime-sd, ymax=Walltime+sd,color=run_by), width=0.15,show.legend = TRUE)

p 
ggsave(p, filename = "plot/large.png")
