summary(wheat_pca)
wheat_pca$rotation
var_scores <- abs(wheat_pca$rotation[,1])
var_scores_ranked <- sort(var_scores, decreasing = TRUE)
names(var_scores_ranked)
