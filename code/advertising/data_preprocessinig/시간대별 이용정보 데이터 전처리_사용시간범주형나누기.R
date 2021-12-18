rm(list=ls())

dpath <- "E:/2021_응통공모전/전처리/"
a <- read.csv(paste0(dpath, '시간대별_1901_2106.csv'))
str(a)


# 기준 : 0~10분, 11~21분, 22~47분, 48~103분, 103~400분, 401~999분

a$사용시간범주 = ifelse(a$사용시간 < 11, 1,
                ifelse(a$사용시간 < 22, 2,
                       ifelse(a$사용시간 < 48, 3,
                              ifelse(a$사용시간 < 103, 4,
                                     ifelse(a$사용시간 < 401, 5,
                                            6)))))
head(a)
str(a)

a <- subset(a, select=c(대여소번호, 대여시간, 성별, 나이, 이용건수, 휴일여부, 사용시간범주))
a <- rename(a, "사용시간"="사용시간범주")
a$대여소번호 <- as.factor(a$대여소번호)
a$대여시간 <- as.factor(a$대여시간)
a$성별 <- as.factor(a$성별)
a$나이 <- as.factor(a$나이)
a$휴일여부 <- as.factor(a$휴일여부)
a$사용시간 <- as.factor(a$사용시간)
str(a)
summary(a)

write.csv(a, file="시간대별_1901_2106.csv")
