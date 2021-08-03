# 2021.08.03 온도 데이터 이상 탐지 / 이은창
# temperature #anomaly #time-series
# 참조 : https://cran.r-project.org/web/packages/anomalize/vignettes/anomalize_quick_start_guide.html

library(tidyverse)
library(tibbletime)
library(anomalize)

# 경로 설정
getwd()
setwd("/cloud/project/R_code/temp_anomaly")


# 데이터 불러오기
raw_df <- read.csv2(file="temp_tag_temp_sample_210803.csv", sep=",")
str(raw_df)


# 데이터 형변환
df <- raw_df
df$reg_dt <- as.POSIXct(df$reg_dt)

df <- as_tbl_time(df, index = reg_dt)
df <- df %>% group_by(spce_id)

  
# anomalized 
df_anomalized <- df %>%
  time_decompose(tag_value, merge=TRUE) %>%
  anomalize(remainder,alpha = 0.05, max_anoms = 0.2) %>%
  time_recompose()

df_anomalized %>% glimpse()


# plot 
plot <- df_anomalized %>% 
  plot_anomalies(time_recomposed = TRUE, ncol=3, alpha_dots = 0.05) + ggtitle("alpha = 0.05")

plot
