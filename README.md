
# 01.시계열 이상치(anomaly) 탐지, 온도 / ver. 210803
- 활용 패키지 : library(anomalize)
- 알고리즘 정리 : 시계열 데이터의 계절성(season)과 트렌드(trend)를 제외한 값(remainder)에서 이상치를 탐지
- 활용 : 공간의 온도 데이터에서 이상치를 탐지 (센서 오류 및 평소보다 더운곳/추운곳을 탐지)
- 샘플 코드 경로 : Data_open/R_code/temp_anomaly/
![1](https://user-images.githubusercontent.com/88355776/127962626-465589d8-648c-4d61-ab40-6566ffc063f1.PNG)

# 02.시계열 이상치(anomaly) 탐지, 에너지 / ver. 210810
- 활용 패키지 : library(anomalize), library(httr)
- 알고리즘 정리 : 시계열 데이터의 계절성(season)과 트렌드(trend)를 제외한 값(remainder)에서 이상치를 탐지
- 활용 : 공공데이터 포탈의 건물 에너지 사용량(전기,가스) 데이터 활용, 에너지 사용 이상치를 탐지 (평소보다 적게/많게 사용한 건물)
- 샘플 코드 경로 : Data_open/R_code/energy_anomaly/
- 샘플 Power BI 대시보드 : https://app.powerbi.com/view?r=eyJrIjoiYjFiYWI1ZDgtZDVjYy00MmM4LTg1ZjEtNmJiZjIwMTZhZTAyIiwidCI6ImUwYjU5NTVmLTFiZGItNGNlMy1hNGUyLTMzZTM4MjdkMjc2NCJ9
![캡처](https://user-images.githubusercontent.com/88355776/128821284-37204c57-0c28-4ceb-81d4-e949847cbe5e.PNG)
![plot_zoom_png (2)](https://user-images.githubusercontent.com/88355776/128792503-7d7ce5fb-7447-424b-9435-412d36cc2772.png)

# 03.유사 공간(space) 그룹화(Clustering) / ver. 210805
- 활용 패키지 : library(cluster)
- 알로리즘 정리 : 공간에서 발생하는 민원(VOC)수 및 종류를 변수로 비슷한 공간들을 그룹화합 (K-means 활용)
- 활용 : 비슷한 공간을 그룹화 하여 클러스터별 Pain Point 발굴 및 해결 방안 마련
- 샘플 코드 경로 : Data_open/R_code/space_clustering/
![plot_zoom_png (1)](https://user-images.githubusercontent.com/88355776/128438053-538a2b2a-ab37-4a95-bd81-f7c68bbbcfee.png)

# 04.서울시 코로나 확진자 정보 / ver. 210811
- 활용 패키지 : library(XML)
- 활용 : 서울 열린데이터 광장, 서울시 코로나19 확진자 현황 API활용, 일자별/지역별 코로나 확진자 현황 파악 (위험한 지역 확인용)
- 샘플 코드 경로 : Data_open/R_code/api_corona/
- 샘플 Power BI 대시보드(매일 새로고침) : https://app.powerbi.com/view?r=eyJrIjoiOGI1YjQyMzEtOWE1YS00ZjQ5LWE5NTMtZTY0N2FmNTBhMTExIiwidCI6ImUwYjU5NTVmLTFiZGItNGNlMy1hNGUyLTMzZTM4MjdkMjc2NCJ9
![확진자](https://user-images.githubusercontent.com/88355776/128974056-b4f435b7-3205-4404-b0b5-621fc3aa795c.PNG)

# 05.올림픽 시청율 분석 / ver. 210813
- 활용 패키지 : -
- 활용 : 시청율 높은 방송 및 타겟을 시각화, TV광고에 활용
- 샘플 코드 경로 : -
- 샘플 Power BI 대시보드 : https://app.powerbi.com/view?r=eyJrIjoiZTFhMWZkY2ItODQ5MS00NDc0LThiMWMtOGU5MDI3MzFhYTY2IiwidCI6ImUwYjU5NTVmLTFiZGItNGNlMy1hNGUyLTMzZTM4MjdkMjc2NCJ9&pageName=ReportSectiond21d7a6a705635ef6092
![11111](https://user-images.githubusercontent.com/88355776/129288535-5b96b886-d20c-43e3-b63d-28601cc50e71.PNG)




# 06.Caret 패키지 활용 / ver.210806
- 샘플링(createDataPartition), 파라미터 설정(trainControl), 혼동행렬 표현(confusionMatrix) 등을 편리하게 사용할수 있도록 함
- 샘플 코드 경로 : Data_open/R_code/test_caret


# 07.T-test 샘플 / ver.210812
- 활용 패키지 : library(MASS)
- 활용 : 7월 평균 DAU 3317, 8월 평균 DAU 3006 --> 두달의 평균 차이가 있다고 할 수 있을까?
- 샘플 코드 경로 : Data_open/R_code/test_t.test/



