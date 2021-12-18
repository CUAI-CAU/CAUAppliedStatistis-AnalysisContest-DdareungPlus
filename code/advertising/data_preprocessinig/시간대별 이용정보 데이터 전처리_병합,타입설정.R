dpath <- "E:/2021_응통공모전/전처리/"
a <- read.csv(paste0(dpath, '시간대별_1901_2008.csv'))
head(a)
str(a)
b <- read.csv(paste0(dpath, '시간대별_2009_2106.csv'))
head(b)
str(b)

result <- rbind(a,b)
str(result)

result <- subset(result, select=c(대여소번호, 대여시간, 성별, 나이, 사용시간, 이용건수, 휴일여부))
str(result)

result$대여소번호 <- as.factor(result$대여소번호)
result$대여시간 <- as.factor(result$대여시간)
result$성별 <- as.factor(result$성별)
result$나이 <- as.factor(result$나이)
result$휴일여부 <- as.factor(result$휴일여부)
str(result)
summary(result)

write.csv(result, file="시간대별_1901_2106.csv")
