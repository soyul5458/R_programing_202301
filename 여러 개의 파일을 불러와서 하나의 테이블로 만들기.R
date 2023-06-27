# 필요한 패키지 설치
install.packages("readxl")  # xlsx 파일 읽기
install.packages("tidyverse")  # 데이터 조작 및 합치기

# 필요한 패키지 라이브러리 로드
library(readxl)
library(tidyverse)

# xlsx 파일 경로 설정
folder_path <- paste0(getwd(), "/기말_1분반 (2)/")

xlsx_files <- list.files(folder_path, pattern = ".xlsx$", full.names = TRUE)
xlsx_files

# 데이터 프레임 초기화
df <- data.frame()

# 각 파일에 대해 작업 수행
for (file in xlsx_files) {
  # 파일 읽기
  file_data <- read_excel(file, sheet = 1, range = "C10:J17")
  combined_data <- file_data[7:7, ]
  
  # 데이터 프레임에 추가
  df <- rbind(df, combined_data)
}

df

# 결과 파일 저장
write.table(df, 
            paste(folder_path, "dataset_all.csv"), 
            sep = ",", 
            row.names = FALSE, 
            col.names = TRUE, 
            quote = FALSE, 
            append = TRUE)


