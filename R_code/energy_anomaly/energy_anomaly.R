# 2021.08.10, 공공데이터 포탈의 건물 에너지 사용량을 활용, 에너지 사용 이상 탐지
# energy #anomaly #time-series # open_api
# 참조1 : https://www.data.go.kr/data/15054212/openapi.do
# 참조2 : https://tidyverse-korea.github.io/r-meetup-x-presser/kaggle/Meetup_3/crawling/getWebR.pdf


library(httr)
library(tidyverse)
library(tibbletime)
library(anomalize)