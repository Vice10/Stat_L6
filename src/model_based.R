library(mclust)
mclust_wheat <- Mclust(wheat, G=3)
summary(mclust_wheat)
plot(mclust_wheat)
