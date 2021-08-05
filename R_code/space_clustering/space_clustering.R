# 2021.08.05 유사공간 그룹핑 (클러스터링)
# space # clustering
# 참조 : https://uc-r.github.io/kmeans_clustering

library(tidyverse)
library(cluster)
library(factoextra)
library(gridExtra)


# 경로 설정
getwd()
setwd("/cloud/project/R_code/space_clustering")

# 데이터 불러오기
raw_df <- read.csv2(file="sample_building_clustering_210805.csv", sep=",")
str(raw_df)


# 공간에 고객이 없는 곳 찾아보기
table(is.na(raw_df$n_customer))

# 형변환 및 NA 값을 0으로 바꾸기 (ing)
df <- raw_df %>%
  select(-1)

df$vote_hot_rate <- as.numeric(df$vote_hot_rate)
df$vote_cold_rate  <- as.numeric(df$vote_cold_rate)
df$voc_all_rate  <- as.numeric(df$voc_all_rate)
df$VOC_toilet_rate <- as.numeric(df$VOC_toilet_rate)
df$VOC_lamp_rate  <- as.numeric(df$VOC_lamp_rate)
df$VOC_electric_rate <- as.numeric(df$VOC_electric_rate)
df$VOC_door_rate  <- as.numeric(df$VOC_door_rate)
df$VOC_dirty_rate <- as.numeric(df$VOC_dirty_rate)
df$VOC_noise_rate <- as.numeric(df$VOC_noise_rate)


df[is.na(df)] <- 0

# 스케일링
df <- scale(df)




# optimal cluster number
set.seed(508)

fviz_nbclust(df, kmeans, method = "wss")
fviz_nbclust(df, kmeans, method = "silhouette")

#gap_stat <- clusGap(df, FUN = kmeans, nstart = 25, K.max = 10, B = 50)
#print(gap_stat, method = "firstmax")
#fviz_gap_stat(gap_stat)


# clustering
k2 <- kmeans(df, centers=2, nstart=25)
k3 <- kmeans(df, centers=3, nstart=25)
k4 <- kmeans(df, centers=4, nstart=25)
k5 <- kmeans(df, centers=5, nstart=25)
k6 <- kmeans(df, centers=6, nstart=25)
k7 <- kmeans(df, centers=7, nstart=25)



# plots to compare
p1 <- fviz_cluster(k2, geom = "point", data = df) + ggtitle("k = 2")
p2 <- fviz_cluster(k3, geom = "point",  data = df) + ggtitle("k = 3")
p3 <- fviz_cluster(k4, geom = "point",  data = df) + ggtitle("k = 4")
p4 <- fviz_cluster(k5, geom = "point",  data = df) + ggtitle("k = 5")
p5 <- fviz_cluster(k6, geom = "point",  data = df) + ggtitle("k = 6")
p6 <- fviz_cluster(k7, geom = "point",  data = df) + ggtitle("k = 7")

grid.arrange(p1, p2, p3, p4,p5,p6, nrow = 3)


# final
set.seed(508)
final <- kmeans(df, 4, nstart = 25)
fviz_cluster(final, data = df)


# attach 
df_final <- raw_df %>%
  mutate(cluster = final$cluster)

df_final[is.na(df_final )] <- 0


#summary
df_final_summary <- df_final %>%
  select(-1) %>%
  group_by(cluster) %>%
  summarise_all("mean")

table(df_final$cluster)

df_final_summary

