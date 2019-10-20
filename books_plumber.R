#* @param rating
#* @param price
#* @param availability
#* @get /getCluster

function(rating, price, availability){
  fields<-c(rating, price, availability)
  fields = as.numeric(fields)
  zeros_matrix = matrix(0, nrow = 3, ncol = 7)
  
  for(i in 1:3){
    distances = dist(x = c(fields[i], books_cluster$centers[, i]))
    distances_matrix= as.matrix(distances)
    distance = distances_matrix[-1,1]
    zeros_matrix[i, ] = distance
  }
  rownames(zeros_matrix) = colnames(books_cluster$centers)
  total_distance = apply(zeros_matrix, 2, sum)
  min_cluster = which.min(total_distance)
  min_cluster 
}
