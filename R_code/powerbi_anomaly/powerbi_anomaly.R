# 우선 날짜를 Text로 변환후 사용해야 함
#.libPaths("C:/Program Files/R/R-4.0.3/library")

library(zoo)
library(tidyverse)
library(tibbletime)
library(anomalize)


df<-dataset
df$date_d <- as.Date(df$date_d)
df <- as_tbl_time(df, index = date_d)

df <- df %>%
  arrange(date_d) %>%
  time_decompose(dau, merge=TRUE) %>%
  anomalize(remainder,alpha = 0.1, max_anoms = 0.2) %>%
  time_recompose()


df <- data.frame(df)


# 아래는 여러개의 그룹에서 이상치 찾는것
#.libPaths("C:/Program Files/R/R-4.0.3/library")

library(zoo)
library(tidyverse)
library(tibbletime)
library(anomalize)


df<-dataset
df$date_d <- as.Date(df$date_d)
df <- as_tbl_time(df, index = date_d)

df <- df %>%
  group_by(bldg_id) %>%
  arrange(date_d) %>%
  time_decompose(dau_d, merge=TRUE) %>%
  anomalize(remainder,alpha = 0.1, max_anoms = 0.2) %>%
  time_recompose()


df <- data.frame(df)

