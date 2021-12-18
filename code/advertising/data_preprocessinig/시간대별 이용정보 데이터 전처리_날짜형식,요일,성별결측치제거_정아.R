dpath <- "E:/2021_응통공모전/전처리/"
a <- read.csv(paste0(dpath, '20200901_20210630_정아.csv'))


#install.packages('dplyr')
library(dplyr)
a <- a %>% filter(!is.na(성별))
summary(a)
str(a)

write.csv(a, file="20200901_20210630_정아.csv")

b <- read.csv(paste0(dpath, '20200901_20210630_정아.csv'))
summary(b)
str(b)



b$대여일자 <- as.Date(b$대여일자, format="%Y-%m-%d")
str(b)

b$대여요일 <- weekdays(as.Date(b$대여일자))
head(b)

write.csv(b, file="20200901_20210630_정아.csv")

c <- read.csv(paste0(dpath, '20200901_20210630_정아.csv'))
head(c)
str(c)
