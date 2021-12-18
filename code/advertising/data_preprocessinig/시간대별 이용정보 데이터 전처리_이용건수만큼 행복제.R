rm(list=ls())

# 데이터 가져와서 이용건수 빼고 factor로 바꾸기
dpath <- "E:/2021_응통공모전/전처리/"
a <- read.csv(paste0(dpath, '시간대별_1901_2106.csv'))
a$대여소번호 <- as.factor(a$대여소번호)
a$대여시간 <- as.factor(a$대여시간)
a$성별 <- as.factor(a$성별)
a$나이 <- as.factor(a$나이)
a$휴일여부 <- as.factor(a$휴일여부)
a$사용시간 <- as.factor(a$사용시간)
str(a)
summary(a)

#library(dplyr)
#library(data.table)

# 이용건수 여러개인 것 -> 그만큼 행 추가
a_cpy <- copy(a)
for (p in a_cpy$대여소번호) {
  b <- a_cpy[a_cpy$대여소번호 == p, ]
  result <- copy(b)
  for (i in rownames(b)) {
    k <- b[i, ]
    if (k$이용건수 > 1) {
      for (j in 1:(k$이용건수-1)) {
        apd <- copy(k)
        result <- rbind(result, apd)
      }
    }
  }
  a_cpy <- rbind(a_cpy, result)
}
summary(a_cpy)
write.csv(a_cpy, file="시간대별_1901_2106_행복제.csv")



#################### 행복제 코드 (대여소번호 3 예시)######################
b <- a[a$대여소번호 == 3, ]  # 대여소번호 3인 것만 가져오기
result <- copy(b)

for (i in rownames(b)) {
  k <- b[i, ]                           # 행 하나 가져오기
  if (k$이용건수 > 1) {
    for (j in 1:(k$이용건수-1)) {       # 이용건수가 1보다 크면, (이용건수-1)개만큼 행 복제해서 추가하기
      apd <- copy(k)
      result <- rbind(result, apd)
    }
  }
}
