library(plumber)
r = plumb("D:\\Data science\\AmazonGuitarScraping\\books_plumber.R")
r$run(port = 8000)

#curl "http://localhost:8000/getCluster?precio=-0.2458767&opiniones=0.3095074&peso=1.0861028&volumen=0.32609&potencia=0.1184234&alto=0.322571&ancho=0.4440596&profundidad=-0.3254523"
#rating 1.1024416 price 0.2806985 availability 3.0919143
