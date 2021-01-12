library(tidyverse)
wheat %>%
  mutate(Cluster = k3$cluster) %>%
  group_by(Cluster) %>%
  summarise_all("mean")

# Rand index
library(fossil)
adj.rand.index(hc.cut$cluster, k3$cluster)

# Principal component analysis
wheat_pca <- prcomp(wheat[,c(1:7)], center = TRUE,scale. = TRUE)
summary(wheat_pca)
fviz_eig(wheat_pca)
library(devtools)
library(ggbiplot)
ggbiplot(wheat_pca)
ggbiplot(wheat_pca,ellipse=TRUE,obs.scale = 1, var.scale = 1, groups=kernels$Var)+
  scale_colour_manual(name="Origin", values= c("forest green", "red3", "dark blue"))+
  ggtitle("PCA wheat")+
  theme_minimal()+
  theme(legend.position = "bottom")
