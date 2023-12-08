library("ggplot2")
dataset<- read.csv("Cui_etal2014.csv", header=TRUE)

attach(dataset)


model1 <- lm(data=dataset, log(Virion.volume..nm.nm.nm.)~log(Genome.length..kb.))

model1

summary(model1)

ggplot(data=dataset, aes(x=log(Genome.length..kb.), y=log(Virion.volume..nm.nm.nm.)))+
  geom_point()+
  geom_smooth(method=lm) +
  labs(x="log[Genome length(kb)]", y="log[Virion volume(nm3)]")+
  theme_bw()
