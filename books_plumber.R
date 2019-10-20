fields = as.vector(data[1,])
zeros_matrix = matrix(0, nrow = 3, ncol = 7)

for(i in 1:3){
  distances = dist(x = c(fields[i], books_cluster$centers[, i]))
  distances_matrix= as.matrix(distances)
  distance = distances_matrix[-1,1]
  zeros_matrix[i, ] = distance
}
rownames(zeros_matrix) = colnames(books_cluster$centers)