# 2021.08.11, 서울열린데이터광장, 코로나 확진자 정보 분석
# open api # corona19
# 참고1 : http://data.seoul.go.kr/dataList/OA-20279/S/1/datasetView.do
# 참고2 : https://magician-of-c.tistory.com/39?category=250800

library(XML)
library(dplyr)


# 서울 코로나 확진자 정보 가져오기
# 최근 1~1000건 (1회 최대 조회가능 1,000건)
url_1 <- "http://openapi.seoul.go.kr:8088/576d424f64676f6c38395a43465944/xml/Corona19Status/1/1000/"
url_2 <- "http://openapi.seoul.go.kr:8088/576d424f64676f6c38395a43465944/xml/Corona19Status/1001/2000/"
url_3 <- "http://openapi.seoul.go.kr:8088/576d424f64676f6c38395a43465944/xml/Corona19Status/2001/3000/"

# DataFrame 로 변환 및 전처리
df1 <- xmlToDataFrame(url_1)
df2 <- xmlToDataFrame(url_2)
df3 <- xmlToDataFrame(url_3)

df <- rbind(df1, df2, df3)
df <- df %>%
  filter(!is.na(CORONA19_ID)) %>%
  select(-1,-2,-3)

head(df)
