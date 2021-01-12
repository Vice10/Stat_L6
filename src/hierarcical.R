# Hierarchical clustering
# ++++++++++++++++++++++++
# Use hcut() which compute hclust and cut the tree
hc.cut <- hcut(wheat, k = 3, hc_method = "ward.D")
# Visualize dendrogram
fviz_dend(hc.cut, show_labels = FALSE, rect = TRUE)
# Visualize cluster
fviz_cluster(hc.cut, ellipse.type = "convex")

library(cluster)
set.seed(123)
gap_stat <- clusGap(wheat, FUN = kmeans, nstart = 25,
                    K.max = 10, B = 500)
# Print the result
print(gap_stat, method = "firstmax")

# Gap statistic
fviz_gap_stat(gap_stat)
