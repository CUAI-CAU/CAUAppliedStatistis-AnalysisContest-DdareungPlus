dpath <- "E:/2021_응통공모전/전처리/"
a <- read.csv(paste0(dpath, '20190601_20191130_서린.csv'))

a$대여일자 <- as.Date(a$대여일자, format="%Y-%m-%d")
a$대여일자

a$대여요일 <- weekdays(as.Date(a$대여일자))
head(a)


#install.packages('dplyr')
library(dplyr)
a <- a %>% filter(!is.na(성별))
summary(a)

write.csv(a, file="20190601_20191130_서린.csv")

b <- read.csv(paste0(dpath, '20190601_20191130_서린.csv'))
summary(b)
str(b)
