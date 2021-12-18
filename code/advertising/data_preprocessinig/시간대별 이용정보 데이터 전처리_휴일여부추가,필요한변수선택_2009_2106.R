dpath <- "E:/2021_응통공모전/전처리/"
a <- read.csv(paste0(dpath, '20200901_20210630_정아.csv'))


# 평일/주말 변수 생성
a["휴일여부"] <- ifelse(a$대여요일 == "토요일",1, 
                     ifelse(a$대여요일 == "일요일",1,2))
head(a)


a_new <- subset(a, select=c(대여소번호, 대여시간, 성별, 나이, 사용시간, 이용건수, 휴일여부))
head(a_new)
str(a_new)

write.csv(a_new, file="시간대별_2009_2106.csv")
