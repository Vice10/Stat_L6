kernels <- read.delim("./data/seeds_dataset.txt", header = TRUE, sep = "\t", dec = ".")
kernels$id <- seq.int(nrow(kernels))
kernels$Var <- as.factor(kernels$Var)

wheat <- kernels[1:7]
wheat <- scale(wheat)
colMeans(wheat)
# shuffle rows
#set.seed(123)
#rows <- sample(nrow(wheat))
#kernels <- wheat[rows,]

# perform cluster analysis
k2 <- kmeans(wheat, centers = 2, nstart = 25)
str(k2)

distance <- get_dist(wheat, method = "euclidian")
fviz_dist(distance, gradient = list(low = "#00AFBB", mid = "white", high = "#FC4E07"))
fviz_cluster(k2, data = wheat)

# Optimal number of clusters
set.seed(123)
fviz_nbclust(wheat, kmeans, method = "wss")

# Average silhouette method
fviz_nbclust(wheat, kmeans, method = "silhouette")


