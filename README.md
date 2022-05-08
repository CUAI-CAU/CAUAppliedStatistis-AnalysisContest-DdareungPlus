# CAUAppliedStatistis-AnalysisContest-DdareungPlus
2021 중앙대학교 응용통계학과 분석공모전, 따릉플러스

## 개요
* 주제 : 데이터 분석을 통한 따릉이 적자 문제 해결 방안
* 기간 : 2021.09. ~ 2021.11.
* 팀원 : 김서린, 김소은, 신정아, 이윤지
* 사용언어 : R, Python

## 분석내용
### 광고 타겟팅  
1. 데이터 전처리
![image](https://user-images.githubusercontent.com/86909645/167281656-7f17cea3-39c7-4002-b9be-5c5190bf4992.png)
* Heatmap으로 상관관계 확인하여 높은 변수들 병합
2. K-means Clustering
* Elbow method 활용하여 최적 군집 수 선정 --> k=4
![image](https://user-images.githubusercontent.com/86909645/167281690-9ad5be59-867b-400a-9e7d-aa5e914b880a.png)
* Decision Tree 활용하여 Cluster별 특징 파악
![image](https://user-images.githubusercontent.com/86909645/167281717-2a46c22e-d4f9-4223-b2c7-c5a07673f602.png)
* 결과
![image](https://user-images.githubusercontent.com/86909645/167281736-4ed104c0-8a83-4a37-a1fc-d6c166b77999.png)

### 자전거 재배치
1. 재배치 자치구 선정
* '일별 반납/대여' 계산하여 variance 높은 구 선정 --> 중구
2. 재배치 수행 날짜, 시간대 선정
* 맑은 날 & 평일/주말 하루씩 선정 --> 21.04.23., 21.04.24.
* '평균 반납/대여'의 절댓값이 큰 시간대 선정 --> (반납많은)6-10시, (대여많은)17-21시
3. K-means Clustering
* 각 대여소를 '(반납수 - 대여수) / 거치대수' 계산하여 정규화 -> group(적음, 적정, 많음)으로 분류
![image](https://user-images.githubusercontent.com/86909645/167281817-02b629f2-f3bb-4926-8f28-ac84a748affc.png)
![image](https://user-images.githubusercontent.com/86909645/167281858-6fd547bf-99c3-4e70-b30e-04288ad40faa.png)
![image](https://user-images.githubusercontent.com/86909645/167281867-8a9c80d6-c8d2-4439-ae0f-0f408f161aa9.png)
4. TSP algorighm
* 데이터 전처리
![image](https://user-images.githubusercontent.com/86909645/167281884-b3197a6e-fd5d-4402-ad8d-2d83a8992929.png)
* TSP 결과
![image](https://user-images.githubusercontent.com/86909645/167281907-f1cc5f87-2135-43de-ab8b-2a1c2f1c9a17.png)
![image](https://user-images.githubusercontent.com/86909645/167281915-a29fbe6c-82c8-4528-b634-34e2573d9261.png)
5. 비용함수 계산
* 최소비용으로 재배치하는 방법을 찾기 위해 각 k에 대해 비용 계산
![image](https://user-images.githubusercontent.com/86909645/167281976-48ee42cf-5184-4f8a-88a6-51af42aa6a52.png)
* 결과
![image](https://user-images.githubusercontent.com/86909645/167281993-657e6a12-4f0b-4987-a780-18d1923b5dbe.png)
![image](https://user-images.githubusercontent.com/86909645/167282006-8acd7dd9-a97f-42f3-8eb3-bab509fa1f37.png)


## 결론 및 한계
![image](https://user-images.githubusercontent.com/86909645/167282034-1c373bc7-89c7-4f62-91f9-6073cfbd68da.png)

