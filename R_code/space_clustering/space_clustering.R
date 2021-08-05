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
raw_df <- read.csv2(file="temp_tag_temp_sample_210803.csv", sep=",")
str(raw_df)