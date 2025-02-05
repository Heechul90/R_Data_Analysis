### 7. 작업용 데이터 가져 오기와 작업 후 저장 하기

## 1) 파일 이름 확인하기 - list.files() 사용하기
list.files()
list.files(recursive=T) # 하위 디렉토리 내용까지 전부 출력
list.files(all.files=T) # 숨김 파일까지 전부 출력

## scan() 함수로 텍스트 파일 읽어서 배열에 저장하기
scan1 <- scan('scan_1.txt')
scan1
scan2 <- scan('scan_2.txt')                  # 1.00 / 2.00 / 3.00 / 4.00 소수점자리를 읽지 못한다. 
scan2
scan2 <- scan('scan_2.txt', what=""); scan2  # 소수점을 읽긴 읽는다.
scan3 <- scan('scan_3.txt')                  # 문자열은 뒤에 옵션을 주지 않으면 에러가 난다
scan3
scan3 <- scan('scan_3.txt', what=""); scan3  # 문자열은 옵션을 줘야 한다.
scan4 <- scan('scan_4.txt', what="")
scan4

input <- scan()
input
input <- scan()
input
input2 <- scan(what="")
input2


## 3) readline() 함수로 한 줄 읽어 들이기
input3 <- readline("A quick brown fox")
input3
input4 <- readline("Are you OK? :")     # 커서가 깜빡인다.

## 4) readLines() 함수로 파일 읽어 들여서 배열에 담기
input5 <- readLines('scan_4.txt')
input5

## 5) read.table로 읽반 텍스트 형태의 파일을 읽어서 데이터 프레임에 담기
fruits <- read.table('fruits.txt')                    # 페이스로 구분되어 있는 파일을 열때 쓰는 함수이다.(하지만)
fruits
rm(fruits)
fruits <- read.table('fruits.txt')
fruits <- read.table('fruits.txt', header=T); fruits  # 첫번째 행을 제목으로 간주해서 인식한다.

fruits2 <- read.table('fruits_2.txt')                 # header가 없고 주석이 있는 txt파일. 주석만 빼고 읽는다.
fruits2
fruits2 <- read.table('fruits_2.txt', skip=2)         # 두줄을 읽지않고 그 다음부터 읽는다.
fruits2
fruits2 <- read.table('fruits_2.txt', nrows =2)       # 밑에서부텨 두줄을 읽지않고 그 다음부터 읽는다.
fruits2

f2top <- read.table('fruits_2.txt', skip=3)     
f2bottom <- read.table('fruits_2.txt', nrows =2)    
f2top; f2bottom


## 6) read.csv() 함수로 csv 불러오기
fruits3 <- read.csv(fruits_3)
fruits3 <- read.csv(fruits_3)
fruits3 <- read.csv('fruits_3.csv')    # header를 옵션을 안줘도 읽는다.
fruits3
fruits4 <- read.csv('fruits_4.csv')    # csv파일은 header가 없으면 없다고 옵션을 넣어줘야한다.
fruits4
fruits4 <- read.csv('fruits_4.csv', header=F)
fruits4

label <- c('NO', 'NAME', 'PRICE', 'QTY')
fruits4 <- read.csv('fruits_4.csv', header=F, col.names = label)
fruits4


## 7) read.csv.sql()명령 - 월하는 데이터를 SQL 쿼리로 불러 오기
install.packages("googleVis")
library(googleVis)
install.packages("sqldf")
library(sqldf)
Fruits
write.csv(Fruits,"Fruits_sql.csv", quote=F,row.names=F)     # csv파일로 저장하는 함수
Fruits
fruits_2 <- read.csv.sql("Fruits_sql.csv", sql="SELECT*FROM file WHERE Year = 2008")
fruits_2
Fruits[,2]
Fruits[,2,Year=2008]

## 8) xls(Microsoft Office Excel) 파일로부터 데이터 프레임에 저장하기
install.packages("XLConnect")
installed.packages()
library(XLConnect)
data1= loadWorkbook("fruits_6.xls",create=T)
data2= readWorksheet(data1, sheet="sheet1", startRow=1, endRow = 8, startCol = 1, endCol = 5)
data2

## 9) 클립보드의 내용을 사용해서 데이터 프레임 생성하기
fruits6 <- read.delim("clipboard", header=T)
fruits6

install.packages('readxl')
library(readxl)
fruits7 <- read_excel("fruits_6.xls",      # path
                      sheet = "Sheet1",    # sheet name to read from
                      range = "A2:D6",     # cell range to read from
                      col_names = TRUE,    # TRUE to use the first row as column names
                      col_types = "guess", # guess the types of columns
                      na = "NA")           # Character vector of strings to use for missing values
fruits7
