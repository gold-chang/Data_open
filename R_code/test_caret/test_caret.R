# 2021.08.06 ML Caret 패키지 활용 샘플
# Ml # caret_package # test
# 참조 : https://lovetoken.github.io/r/machinelearning/2017/04/23/caret_package.html

library(caret)
library(tidyverse)
library(randomForest)
library(e1071)


# 샘플 데이터 불러오기
data(Sonar, package = "mlbench")
tbl_1 <- as_tibble(Sonar)
str(Sonar)


# test/train 셋 나누기
set.seed(0508)
indexTrain <- createDataPartition(tbl_1$Class, p = 0.7, list=F)
tbl_train <- tbl_1[indexTrain, ]
tbl_test <- tbl_1[-indexTrain, ]

table(tbl_train$Class)
table(tbl_test$Class)


# trainControl 설정(최저파라미터 찾기)
fitControl <- trainControl(method = "repeatedcv", number = 10, repeats = 10)


# train 셋으로 모델 만들기 (RF 및 GBM)
RF_fit <- train(Class~. , data = tbl_train, method = "rf", trControl = fitControl, verbose = FALSE)
GBM_fit <- train(Class~. , data = tbl_train, methdo = "gbm", trControl = fitControl, verbosd = FALSE)
RF_fit
GBM_fit


# test 셋으로 검증
pre_rf <- predict(RF_fit, newdata = tbl_test)
pre_gbm <- predict(GBM_fit, newdata = tbl_test)



# 혼동행렬로 정확도 확인 --> GBM이 더 좋음
confusionMatrix(pre_rf, tbl_test$Class)
confusionMatrix(pre_gbm, tbl_test$Class)

