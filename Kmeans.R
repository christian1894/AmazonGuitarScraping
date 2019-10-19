#DATA SCALING
data = books_data_frame
data = data[, -1]
data = scale(data)

#CLUSTER
cluster = kmeans(data, 3, iter.max = 30, nstart = 5)
wss = (nrow(data) - 1) *sum(apply(data,2,var))
for (i in 2:20) wss[i] = sum(kmeans(data, centers = i)$withinss)
plot(1:20, wss, type = "b", xlab = "Clusters", ylab = "withinss groups")

#KMEANS 7 CLUSTERS

books_cluster = kmeans(data, centers = 7, iter.max = 30, nstart = 5)
library(fmsb)
par(mfrow=c(2,4))
dat<-as.data.frame(t(books_cluster$centers[1, ]))
dat
dat<-rbind(rep(1.5,10), rep(-1.5,10), dat)
dat
radarchart(dat)

dat<-as.data.frame(t(books_cluster$centers[2, ]))
dat
dat<-rbind(rep(1.5,10), rep(-1.5,10), dat)
dat
radarchart(dat)

dat<-as.data.frame(t(books_cluster$centers[3, ]))
dat
dat<-rbind(rep(1.5,10), rep(-1.5,10), dat)
dat
radarchart(dat)

dat<-as.data.frame(t(books_cluster$centers[4, ]))
dat
dat<-rbind(rep(1.5,10), rep(-1.5,10), dat)
dat
radarchart(dat)

dat<-as.data.frame(t(books_cluster$centers[5, ]))
dat
dat<-rbind(rep(1.5,10), rep(-1.5,10), dat)
dat
radarchart(dat)
dat<-as.data.frame(t(books_cluster$centers[6, ]))
dat
dat<-rbind(rep(1.5,10), rep(-1.5,10), dat)
dat
radarchart(dat)

dat<-as.data.frame(t(books_cluster$centers[7, ]))
dat
dat<-rbind(rep(1.5,10), rep(-1.5,10), dat)
dat
radarchart(dat)
