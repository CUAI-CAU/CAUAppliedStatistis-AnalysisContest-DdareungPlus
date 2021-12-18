rm(list=ls())

dpath <- "E:/2021_응통공모전/전처리/"
a <- read.csv(paste0(dpath, '시간대별_1901_2106.csv'))
ut <- a$사용시간
ut

# min 0, 1사분위 10, 2사분위 21, 3사분위 47, max 22183
summary(ut)

UpperQ = fivenum(ut)[4]
LowerQ = fivenum(ut)[2]
IQR = UpperQ - LowerQ
upperOutlier = ut[which(ut > UpperQ + IQR*1.5)]
upperOutlier
length(upperOutlier)


ut_1000 <- ut[ut < 1000]
summary(ut_1000)
hist(ut_1000)

ut_400 <- ut[ut < 400]
summary(ut_400)
hist(ut_400, breaks=100)


ut_200 <- ut[ut < 200]
summary(ut_200)
hist(ut_200, breaks=100)

# min 48, 1사분위 57, 2사분위 75, 3사분위 103, max 999
ut_47 <- ut[ut > 47 & ut < 1000]
summary(ut_47)
hist(ut_47)
# 히스토그램 결과 400 이상으로는 데이터 거의 없음 -> 400분 이상이면 반납하지 않은 자전거로 간주

#################
# 기준 : 0~10분, 11~21분, 22~47분, 48~103분, 103~400분, 400~999분
