library(factoextra)
k3 <- kmeans(wheat, centers = 3, nstart = 25)
k4 <- kmeans(wheat, centers = 4, nstart = 25)
k5 <- kmeans(wheat, centers = 5, nstart = 25)

# plots to compare
p1 <- fviz_cluster(k2, geom = "point", data = wheat) + ggtitle("k = 2")
p2 <- fviz_cluster(k3, geom = "point",  data = wheat) + ggtitle("k = 3")
p3 <- fviz_cluster(k4, geom = "point",  data = wheat) + ggtitle("k = 4")
p4 <- fviz_cluster(k5, geom = "point",  data = wheat) + ggtitle("k = 5")

library(gridExtra)
grid.arrange(p1, p2, p3, p4, nrow = 2)

###
wheat %>%
  as_tibble() %>%
  mutate(cluster = k2$cluster,
         state = kernels$Var) %>%
  ggplot(aes(AC, LKG, color = factor(cluster), label = state)) +
  geom_text()
