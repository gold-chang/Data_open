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


# '%'지우고, 숫자형태로 형변환, NA 값은 0으로
df <- raw_df %>%
  select(-1)

df$vote_hot_rate <- as.numeric(gsub("%","", df$vote_hot_rate,fixed = TRUE))
df$vote_cold_rate <- as.numeric(gsub("%","", df$vote_cold_rate,fixed = TRUE))
df$voc_all_rate <- as.numeric(gsub("%","", df$voc_all_rate,fixed = TRUE))
df$VOC_toilet_rate <- as.numeric(gsub("%","", df$VOC_toilet_rate,fixed = TRUE))
df$VOC_lamp_rate<- as.numeric(gsub("%","", df$VOC_lamp_rate,fixed = TRUE))
df$VOC_electric_rate <- as.numeric(gsub("%","", df$VOC_electric_rate,fixed = TRUE))
df$VOC_door_rate  <- as.numeric(gsub("%","", df$VOC_door_rate ,fixed = TRUE))
df$VOC_dirty_rate <- as.numeric(gsub("%","", df$VOC_dirty_rate,fixed = TRUE))
df$VOC_noise_rate <- as.numeric(gsub("%","", df$VOC_noise_rate,fixed = TRUE))

df[is.na(df)] <- 0
str(df)


# 스케일링
df_scale <- scale(df)


# 최적의 클러스터 수 찾기
set.seed(508)

fviz_nbclust(df_scale, kmeans, method = "wss")
fviz_nbclust(df_scale, kmeans, method = "silhouette")

#gap_stat <- clusGap(df_scale, FUN = kmeans, nstart = 25, K.max = 10, B = 50)
#print(gap_stat, method = "firstmax")
#fviz_gap_stat(gap_stat)


# 2~7개 클러스터 
k2 <- kmeans(df_scale, centers=2, nstart=25)
k3 <- kmeans(df_scale, centers=3, nstart=25)
k4 <- kmeans(df_scale, centers=4, nstart=25)
k5 <- kmeans(df_scale, centers=5, nstart=25)
k6 <- kmeans(df_scale, centers=6, nstart=25)
k7 <- kmeans(df_scale, centers=7, nstart=25)


# 눈으로 확인해 보기
p1 <- fviz_cluster(k2, geom = "point", data = df) + ggtitle("k = 2")
p2 <- fviz_cluster(k3, geom = "point",  data = df) + ggtitle("k = 3")
p3 <- fviz_cluster(k4, geom = "point",  data = df) + ggtitle("k = 4")
p4 <- fviz_cluster(k5, geom = "point",  data = df) + ggtitle("k = 5")
p5 <- fviz_cluster(k6, geom = "point",  data = df) + ggtitle("k = 6")
p6 <- fviz_cluster(k7, geom = "point",  data = df) + ggtitle("k = 7")

grid.arrange(p1, p2, p3, p4,p5,p6, nrow = 3)


# 최종 클러스터
set.seed(508)
final <- kmeans(df_scale, 2, nstart = 25)
fviz_cluster(final, data = df)


# 위치, 클러스터 붙이기
df_final <- df %>%
  mutate(floor_id = raw_df$floor_id) %>%
  mutate(cluster = final$cluster)


# 클러스터별 평균 정보 확인
df_final_summary <- df_final %>%
  select(-floor_id) %>%
  group_by(cluster) %>%
  summarise_all("mean")

df_final_summary

table(df_final$cluster)



