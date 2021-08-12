# 2021.08.12, 7월 및 8월 DAU 평균, 차이가 있는지 검증
# t-test # DAU
# 참고 : https://rfriend.tistory.com/127

library(MASS)
library(readxl)
library(tidyverse)
library(lubridate)


# 경로 설정
getwd()
setwd("/cloud/project/R_code/test_t.test")


# 데이터 불러오기 및 전처리
raw_df <- read_xlsx(path = 'dau_2107_08.xlsx', col_names = TRUE)
str(raw_df)

df <- raw_df %>%
  mutate(month = month(날짜)) %>%
  dplyr::select(month,"합계 DAU개") %>%
  rename(dau = "합계 DAU개")


# 데이터 탐색
table(df$month)

df %>%
  group_by(month) %>%
  summarise(mean = mean(dau))

boxplot(dau ~ month, data=df)


# 두 모집단 분산 동일성 검정
var.test(dau ~ month, data=df)
# (해석) p-value : 0.9574 --> '분산의 차이가 없다' 라는 귀무가설 채택 --> 분산 동일

# t-test
t.test(dau ~ month, data=df, var.equal = TRUE, conf.level = 0.95)
# (해석)p-value = 0.6307 --> '모평균에는 차이가 없다' 라는 귀무가설 채택 --> 차이가 없음


# 8월의 값이 10개로 샘플수가 적어서, 차이가 있다고 할 수 없다 해석한 듯함
