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




library(dplyr)

# (대여소번호, 휴일여부, 대여시간) 기준으로 성별 count
group_sex <- a %>% group_by(대여소번호, 휴일여부, 대여시간, 성별) %>%
                summarise(count_sex = sum(이용건수))

sex_0 <- group_sex[group_sex$성별 == 0, ]
sex_0 <- sex_0 %>% select(-성별)
sex_0 <- sex_0 %>% rename(cnt_sex_0 = count_sex)

sex_1 <- group_sex[group_sex$성별 == 1, ]
sex_1 <- sex_1 %>% select(-성별)
sex_1 <- sex_1 %>% rename(cnt_sex_1 = count_sex)



# (대여소번호, 휴일여부, 대여시간) 기준으로 나이 count
group_age <- a %>% group_by(대여소번호, 휴일여부, 대여시간, 나이) %>%
                summarise(count_age = sum(이용건수))
age_10 <- group_age[group_age$나이 == 10, ]
age_10 <- age_10 %>% select(-나이)
age_10 <- age_10 %>% rename(cnt_age_10 = count_age)

age_20 <- group_age[group_age$나이 == 20, ]
age_20 <- age_20 %>% select(-나이)
age_20 <- age_20 %>% rename(cnt_age_20 = count_age)

age_30 <- group_age[group_age$나이 == 30, ]
age_30 <- age_30 %>% select(-나이)
age_30 <- age_30 %>% rename(cnt_age_30 = count_age)

age_40 <- group_age[group_age$나이 == 40, ]
age_40 <- age_40 %>% select(-나이)
age_40 <- age_40 %>% rename(cnt_age_40 = count_age)

age_50 <- group_age[group_age$나이 == 50, ]
age_50 <- age_50 %>% select(-나이)
age_50 <- age_50 %>% rename(cnt_age_50 = count_age)

age_60 <- group_age[group_age$나이 == 60, ]
age_60 <- age_60 %>% select(-나이)
age_60 <- age_60 %>% rename(cnt_age_60 = count_age)

age_70 <- group_age[group_age$나이 == 70, ]
age_70 <- age_70 %>% select(-나이)
age_70 <- age_70 %>% rename(cnt_age_70 = count_age)



# (대여소번호, 휴일여부, 대여시간) 기준으로 사용시간 count
group_usetime <- a %>% group_by(대여소번호, 휴일여부, 대여시간, 사용시간) %>%
                    summarise(count_usetime = sum(이용건수))
usetime_1 <- group_usetime[group_usetime$사용시간 == 1, ]
usetime_1 <- usetime_1 %>% select(-사용시간)
usetime_1 <- usetime_1 %>% rename(cnt_usetime_1 = count_usetime)

usetime_2 <- group_usetime[group_usetime$사용시간 == 2, ]
usetime_2 <- usetime_2 %>% select(-사용시간)
usetime_2 <- usetime_2 %>% rename(cnt_usetime_2 = count_usetime)

usetime_3 <- group_usetime[group_usetime$사용시간 == 3, ]
usetime_3 <- usetime_3 %>% select(-사용시간)
usetime_3 <- usetime_3 %>% rename(cnt_usetime_3 = count_usetime)

usetime_4 <- group_usetime[group_usetime$사용시간 == 4, ]
usetime_4 <- usetime_4 %>% select(-사용시간)
usetime_4 <- usetime_4 %>% rename(cnt_usetime_4 = count_usetime)

usetime_5 <- group_usetime[group_usetime$사용시간 == 5, ]
usetime_5 <- usetime_5 %>% select(-사용시간)
usetime_5 <- usetime_5 %>% rename(cnt_usetime_5 = count_usetime)

usetime_6 <- group_usetime[group_usetime$사용시간 == 6, ]
usetime_6 <- usetime_6 %>% select(-사용시간)
usetime_6 <- usetime_6 %>% rename(cnt_usetime_6 = count_usetime)



# 데이터 합치기
result <- full_join(sex_0, sex_1, key=c(대여소번호, 휴일여부, 대여시간))
result <- full_join(result, age_10, key=c(대여소번호, 휴일여부, 대여시간))
result <- full_join(result, age_20, key=c(대여소번호, 휴일여부, 대여시간))
result <- full_join(result, age_30, key=c(대여소번호, 휴일여부, 대여시간))
result <- full_join(result, age_40, key=c(대여소번호, 휴일여부, 대여시간))
result <- full_join(result, age_50, key=c(대여소번호, 휴일여부, 대여시간))
result <- full_join(result, age_60, key=c(대여소번호, 휴일여부, 대여시간))
result <- full_join(result, age_70, key=c(대여소번호, 휴일여부, 대여시간))
result <- full_join(result, usetime_1, key=c(대여소번호, 휴일여부, 대여시간))
result <- full_join(result, usetime_2, key=c(대여소번호, 휴일여부, 대여시간))
result <- full_join(result, usetime_3, key=c(대여소번호, 휴일여부, 대여시간))
result <- full_join(result, usetime_4, key=c(대여소번호, 휴일여부, 대여시간))
result <- full_join(result, usetime_5, key=c(대여소번호, 휴일여부, 대여시간))
result <- full_join(result, usetime_6, key=c(대여소번호, 휴일여부, 대여시간))

result[is.na(result)] <- 0    # NA to zero
head(result, 20)


write.csv(result, file="군집분석전처리_최종.csv")

