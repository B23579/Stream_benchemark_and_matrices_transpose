setwd("D:/University of Trieste/project/Stream_benchemark_and_matrices_transpose")
library(tidyverse)
library(tibble)



n0col<-read.csv("result/no-op-col.csv", header = FALSE,sep=";") 
n0col%>%rename(Size=V1, Time=V2)-> n0col
n0col$Size<- as.numeric(n0col$Size)
n0col$Time<- as.numeric(n0col$Time)


n1col<-read.csv("result/no-o1-col.csv", header = FALSE,sep=";") 
n1col%>%rename(Size=V1, Time=V2)-> n1col
n1col$Size<- as.numeric(n1col$Size)
n1col$Time<- as.numeric(n1col$Time)

n2col<-read.csv("result/no-o2-col.csv", header = FALSE,sep=";") 
n2col%>%rename(Size=V1, Time=V2)-> n2col
n2col$Size<- as.numeric(n2col$Size)
n2col$Time<- as.numeric(n2col$Time)

n3col<-read.csv("result/no-o3-col.csv", header = FALSE,sep=";") 
n3col%>%rename(Size=V1, Time=V2)-> n3col
n3col$Size<- as.numeric(n3col$Size)
n3col$Time<- as.numeric(n3col$Time)

n0row<-read.csv("result/no-op-row.csv", header = FALSE,sep=";") 
n0row%>%rename(Size=V1, Time=V2)-> n0row
n0row$Size<- as.numeric(n0row$Size)
n0row$Time<- as.numeric(n0row$Time)

n1row<-read.csv("result/no-o1-row.csv", header = FALSE,sep=";") 
n1row%>%rename(Size=V1, Time=V2)-> n1row
n1row$Size<- as.numeric(n1row$Size)
n1row$Time<- as.numeric(n1row$Time)

n2row<-read.csv("result/no-o2-row.csv", header = FALSE,sep=";") 
n2row%>%rename(Size=V1, Time=V2)-> n2row
n2row$Size<- as.numeric(n2row$Size)
n2row$Time<- as.numeric(n2row$Time)

n3row<-read.csv("result/no-o3-row.csv", header = FALSE,sep=";") 
n3row%>%rename(Size=V1, Time=V2)-> n3row
n3row$Size<- as.numeric(n3row$Size)
n3row$Time<- as.numeric(n3row$Time)



n0row<-tibble(n0row)
n0row %>%group_by(Size)%>% 
  summarize(Walltime = mean(Time, ra.rm=TRUE), sd=sd(Time,na.rm = TRUE)) -> n0row

n1row<-tibble(n1row)
n1row %>%group_by(Size)%>% 
  summarize(Walltime = mean(Time, ra.rm=TRUE), sd=sd(Time,na.rm = TRUE)) -> n1row

n2row<-tibble(n2row)
n2row %>%group_by(Size)%>% 
  summarize(Walltime = mean(Time, ra.rm=TRUE), sd=sd(Time,na.rm = TRUE)) -> n2row

n3row<-tibble(n3row)
n3row %>%group_by(Size)%>% 
  summarize(Walltime = mean(Time, ra.rm=TRUE), sd=sd(Time,na.rm = TRUE)) -> n3row

n0col<-tibble(n0col)
n0col %>%group_by(Size)%>% 
  summarize(Walltime = mean(Time, ra.rm=TRUE), sd=sd(Time,na.rm = TRUE)) -> n0col

n1col<-tibble(n1col)
n1col %>%group_by(Size)%>% 
  summarize(Walltime = mean(Time, ra.rm=TRUE), sd=sd(Time,na.rm = TRUE)) -> n1col

n2col<-tibble(n2col)
n2col %>%group_by(Size)%>% 
  summarize(Walltime = mean(Time, ra.rm=TRUE), sd=sd(Time,na.rm = TRUE)) -> n2col

n3col<-tibble(n3col)
n3col %>%group_by(Size)%>% 
  summarize(Walltime = mean(Time, ra.rm=TRUE), sd=sd(Time,na.rm = TRUE)) -> n3col


n<-nrow(n0col)

coll = rep("column",n)
level <-rep("Level 00",n)
n0col<- mutate(n0col,level = level, run_by=coll)

level <-rep("Level 01",n)
n1col<- mutate(n1col,level = level,run_by=coll)
level <-rep("Level 02",n)
n2col<- mutate(n2col,level = level,run_by=coll)
level <-rep("Level 03",n)
n3col<- mutate(n3col,level = level,run_by=coll)


n<-nrow(n0row)

coll = rep("row",n)
level <-rep("Level 00",n)
n0row<- mutate(n0row,level = level, run_by=coll)

level <-rep("Level 01",n)
n1row<- mutate(n1row,level = level,run_by=coll)
level <-rep("Level 02",n)
n2row<- mutate(n2row,level = level,run_by=coll)
level <-rep("Level 03",n)
n3row<- mutate(n3row,level = level,run_by=coll)

result <- rbind(n0row,n1row,n2row,n3row,n0col,n1col,n2col,n3col)
result$level <-as.factor(result$level)
result$run_by<-as.factor(result$run_by)

p<-ggplot(result)+
  geom_point(mapping = aes(x=Size,y=Walltime, color=level,linetype=run_by))+
  geom_smooth(mapping = aes(x=Size,y=Walltime,color=level,linetype=run_by),se=FALSE) +
  labs(x="N", y= "Runtime(ms)", title = "Runtime as a function of matrix size NxN")+
  theme(plot.title = element_text(hjust = 0.5))+
  geom_errorbar(aes(x=Size, ymin=Walltime-sd, ymax=Walltime+sd,color=level,linetype=run_by), width=0.15,show.legend = TRUE)

p 
ggsave(p, filename = "plot/run.png")


p<-ggplot(result)+
  geom_point(mapping = aes(x=Size,y=Walltime, color=run_by))+
  geom_smooth(mapping = aes(x=Size,y=Walltime,color=run_by),se=FALSE) +
  labs(x="N", y= "Runtime(ms)", title = "Runtime as a function of matrix size NxN")+
  theme(plot.title = element_text(hjust = 0.5))+
  geom_errorbar(aes(x=Size, ymin=Walltime-sd, ymax=Walltime+sd,color=run_by), width=0.15,show.legend = TRUE)+
  facet_wrap(~ level, nrow = 2)
p

ggsave(p, filename = "plot/wrap.png")

