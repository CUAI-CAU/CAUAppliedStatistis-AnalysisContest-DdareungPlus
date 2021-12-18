dpath <- "C:/Users/soeun/OneDrive/바탕 화면/"
df <- read.csv(paste0(dpath, '군집분석전처리_최종.csv'))
head(df)
df<- df[,-1]
str(df)

###################
# k-means 군집분석#
###################
# 휴일여부:2 , 대여시간:2
df1_1 <- subset(df, 대여시간 == 4 & 휴일여부 ==2)
df1_1 <- subset(df1_1, select= -c(휴일여부, 대여시간))
str(df1_1)

# 히트맵
cor1_1 <- cor(df1_1)

#install.packages('corrplot')
library(corrplot)

col <- colorRampPalette(c("#EC592E","#E8E800","#289BF0","#BA1EFF","#1EA316"))
corrplot(cor1_1,
         method="color",
         type="lower",
         order="hclust",
         addCoef.col="black",
         tl.col="black",
         tl.srt=45,
         diag=F)

df1_1 <- subset(df1_1, select=-c(sex_0, sex_1)) #성별제거
cor1_1 <- cor(df1_1)
corrplot(cor1_1,
         method="color",
         type="lower",
         order="hclust",
         addCoef.col="black",
         tl.col="black",
         tl.srt=45,
         diag=F)

df1_1$usetime_1_2 <- (df1_1$usetime_2+ df1_1$usetime_1)/2
df1_1$usetime_3_4 <- (df1_1$usetime_3+df1_1$usetime_4)/2
df1_1$age_30_40 <- (df1_1$age_40 + df1_1$age_30)/2
df1_1_ed <- subset(df1_1, select=-c(usetime_1,usetime_2,usetime_3,usetime_4, age_30,age_40))
str(df1_1_ed)


# 파이썬에서 elbow 확인
df1_1_ed2 <- subset(df1_1_ed, select=-c(대여소번호))
write.csv(df1_1_ed2, file="df2_4_ed2.csv")


# 군집분석
kmeans <- kmeans(df1_1_ed2,4, nstart=10) 
plot(kmeans$cluster)  # 어떤 군집으로 분류되었는지 확인


# 군집에 따라 분류
df1_1_ed$kmeans <- kmeans$cluster
#df1_1_ed <- df1_1_ed[!(df1_1_ed$kmeans ==4),]  # 이상치 제거
df1_1_ed$kmeans <- as.factor(df1_1_ed$kmeans)
df1_1_ed$kmeans <- factor(df1_1_ed$kmeans, levels=c(1,2,3,4), labels=c("one","two","three","four"))

str(df1_1_ed)
table(df1_1_ed$kmeans)


####decision tree
#install.packages('rpart')
library(rpart)

m <- rpart(kmeans ~., data=df1_1_ed)
m

#install.packages("rpart.plot")
library(rpart.plot)      
prp(m, type=4, extra=2, digits=3) 
