# 2021.08.10, 공공데이터 포탈의 건물 에너지 사용량을 활용, 에너지 사용 이상 탐지
# energy #anomaly #time-series # open_api
# 참조1 : https://www.data.go.kr/data/15054212/openapi.do
# 참조2 : https://tidyverse-korea.github.io/r-meetup-x-presser/kaggle/Meetup_3/crawling/getWebR.pdf


library(httr)
library(tidyverse)
library(tibbletime)
library(anomalize)


# url 나누기 ,인증키는 비공개 처리함
url_1_1 <- "http://apis.data.go.kr/1611000/BldEngyService/getBeElctyUsgInfo?"
url_1_2 <- "***"
url_1_3 <- "numOfRows=10&pageNo=1&"
url_1_4 <- "sigunguCd=11680&bjdongCd=10300&bun=0012&ji=0000&useYm=20"

url_1 <- paste(url_1_1, url_1_2, url_1_3, url_1_4, sep = "")



# 2015~21 가져오기
y <- 0
m <- 0
df_energy <- data.frame()

for(i in 15:21){
  y<- sprintf("%02d", as.numeric(i))
  
  for (j in 1:12) {
    m <- sprintf("%02d", as.numeric(j))
    url <- paste(url_1, y, m, sep="")
    get <- GET(url)
    newPlatPlc <- content(get)$response$body$items$item$newPlatPlc
    useYm <- content(get)$response$body$items$item$useYm
    useQty <- content(get)$response$body$items$item$useQty
    now_df <- data.frame(newPlatPlc, useYm, useQty)
    df_energy <- rbind(df_energy, now_df )
  }
  
}


# 가져온 데이터 전처리
str(df_energy)
head(df_energy)

df_energy_1 <- df_energy %>%
  mutate (date = as.POSIXct( paste( substr(useYm,1,4),substr(useYm,5,6),"01", sep="-" ) ) ) %>%
  select(date, useQty) %>%
  as_tbl_time(index=date) 


# 이상치 계산 (auto)
df_anomalized <- df_energy_1 %>%
  time_decompose(useQty, merge=TRUE) %>%
  anomalize(remainder,alpha = 0.05, max_anoms = 0.2) %>%
  time_recompose()

df_anomalized %>% glimpse()


# 시각화
plot_1 <- df_anomalized %>% 
  plot_anomalies(time_recomposed = TRUE, ncol=3, alpha_dots = 0.05) + ggtitle("alpha = 0.05")
plot_1
