
# 01. 시계열 이상치(anomaly) 탐지 / ver. 210803
- 활용 패키지 : library(anomalize)
- 알고리즘 정리 : 시계열 데이터의 계절성(season)과 트렌드(trend)를 제외한 값(remainder)에서 이상치를 탐지
- 활용 : 공간의 온도 데이터에서 이상치를 탐지 (센서 오류 및 평소보다 더운곳.추운곳을 탐지)
- 샘플 코드 경로 : Data_open/R_code/temp_anomaly/
![1](https://user-images.githubusercontent.com/88355776/127962626-465589d8-648c-4d61-ab40-6566ffc063f1.PNG)


@ 02. 공간(space) 그룹화(Clustering) / ver. 210806
- 활용 패키지 : library(cluster)
- 알로리즘 정리 : 공간에서 발생하는 민원(VOC)수를 변수로 비슷한 공간들을 그룹화합 (K-means 활용)
- 활용 : 비슷한 공간을 그룹화 하여 클러스터별 Pain Point 발굴 및 해결 방안 마련
- 샘플 코드 경로 : Data_open/R_code/space_clustering/
![plot_zoom_png (1)](https://user-images.githubusercontent.com/88355776/128438053-538a2b2a-ab37-4a95-bd81-f7c68bbbcfee.png)
