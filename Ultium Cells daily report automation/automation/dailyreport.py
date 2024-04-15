# 텍스트 파일 경로 설정
file_path = 'KakaoTalk_20240123_2239_18_994_group.txt'

#date형식 바꾸는함수
def MDY(date):
    date_parts = date.split(' ')
    year = date_parts[0][:-1]  # '년' 제거
    month = date_parts[1][:-1]  # '월' 제거
    day = date_parts[2][:-1]  # '일' 제거
    new_format = '{}-{}-{}'.format(year.zfill(2), month.zfill(2), day)
    date = new_format
    return date
def convert_date_format(input_date):
    # 주어진 날짜 문자열을 공백을 기준으로 나누기
    parts = input_date.replace(',','').split()

    # # 월 이름과 일을 추출
    month_name = parts[1]
    day = parts[2]  # 쉼표 제거
    year = parts[3]

    # 월 이름을 숫자로 매핑
    month_mapping = {
        'January': '1',
        'February': '2',
        'March': '3',
        'April': '4',
        'May': '5',
        'June': '6',
        'July': '7',
        'August': '8',
        'September': '9',
        'October': '10',
        'November': '11',
        'December': '12'
    }

    # 딕셔너리에서 월 이름 찾기
    month = month_mapping.get(month_name)

    # 원하는 형식으로 날짜 조합
    # new_format = '{}/{}/{}'.format(month.zfill(2), day.zfill(2), year)
    new_format = f"{year}-{month}-{day}"
    date = new_format
    return date


# 파일을 읽기 모드로 열기
with open(file_path, 'r',encoding='utf-8') as file:    
    # line변수에 첫라인 집어넣음
    line = file.readline()  
    pre_line = "STRING"
    issue = []
    date = ''
    while line:#끝줄까지 반복          
        if '년' in line and '월' in line and '일' in line and '요일' in line: 
            date = line.replace('-', '').strip()
            date = MDY(date) # MDY 함수호출
        elif ', 2024' in line or ', 2023' in line or ', 2025' in line or ', 2026' in line: 
            date = line.replace('-', '').strip() #Thursday, January 4, 2024
            date = convert_date_format(date) # convert_date_format 함수호출
        if '■' in line or '호기 :' in line or '현상 :' in line or '원인 :' in line or '조치사항 :' in line or '호기:' in line or '현상:' in line or '원인:' in line or '조치사항:' in line:#지금 라인에 만약에 네모가 있으면 '■' 이후의 텍스트 출력 (strip()으로 양쪽끝에있는 공백 제거)
            if '조치인원' in line:  #조치인원이면 마지막 네모니깐 담에 날짜 출력하고 한칸띄우기
                print(line[line.index('■')+1:].strip())
                print("날짜 :", date, '\n')  
            elif '■' in line:
                print(line[line.index('■')+1:].strip())           
            else: print(line[line.index(':')+1:].strip())                        
        else: #없으면
            #근데 만약 전 줄에 호기 or 현상 or 원인 or 조치사항이었다면 
            #원래 보통 다음줄에도 네모가 있어야되는데 없는거니깐
            if '호기 :' in pre_line or '현상 :' in pre_line or '원인 :' in pre_line or '조치사항 :' in pre_line or '호기:' in pre_line or '현상:' in pre_line or '원인:' in pre_line or '조치사항:' in pre_line: 
                # 없는데 위엣줄이 호기현상원인조치사항중 하나이면
                #다음줄이 ■ 나올때까지 출력
                x=1
                while x == 1:
                    print(line.strip(),"-----------------------------------------")
                    line = file.readline()
                    if '년' in line and '월' in line and '일' in line and '요일' in line: 
                        date = line.replace('-', '').strip()
                        date = MDY(date) # MDY 함수호출
                    if '■' in line: 
                        x=0  #네모 나왔으니깐 이제 지금 이 네모 포함된 줄만 출력하고 while빠져나오기
                        if '조치인원 :' in line or '조치인원:' in line:  #조치인원이면 마지막 네모니깐 담에 날짜 출력하고 한칸띄우기
                            print(line[line.index('■')+1:].strip()) #.strip()을 안함으로써 다음줄 한칸띄우기
                            print("날짜 :", date, '\n')
                        else: print(line[line.index('■')+1:].strip())
                        
        pre_line = line
        line = file.readline()# 여기서 line에 다음라인 집어넣음

import subprocess 
command = "python dailyreport.py > output1.txt"
process = subprocess.run(command, shell=True) #출력뜬거 그대로 텍스트파일 생성후 저장

# ----------------------------------------------------------
# 줄바꿈된거를 이전 라인에 이어붙이는 코드

# 입력 파일 경로와 출력 파일 경로 지정
input_file_path = 'output1.txt'
output_file_path = 'output2.txt'

# 입력 파일 열기
with open(input_file_path, 'r', encoding='utf-8') as input_file:
    # 파일 내용 읽기
    lines = input_file.readlines()

# 새로운 내용을 저장할 리스트 생성
new_lines = []

# 각 라인에 대해 처리
for line in lines:
    # 현재 라인이 "-----"을 포함하면 "-----"를 제거하고 이전 라인에 이어붙임
    if "-----" in line:
        new_lines[-1] = new_lines[-1].strip() + ' ' + line.replace('-', '')
    else:
        new_lines.append(line)

# 출력 파일에 쓰기
with open(output_file_path, 'w', encoding='utf-8') as output_file:
    output_file.writelines(new_lines)

# ----------------------------------------------------------
# 호기를 분리하는코드 

# 입력 파일 경로와 출력 파일 경로 지정
input_file_path = 'output2.txt'
output_file_path = 'output3.txt'

def machine_line(line):    
    index = line.find('-')  #index에 "-"가 몇번째에 들어있는지 숫자가 저장됌
    if index-1 == 0 :  #10호기들은 한자리 더 앞으로
        return line[index-2:index+2]
    else :
        return line[index-1:index+2]  #양옆에 숫자랑 함꼐 리턴   ex)7-1
def start_end_time(line):
    if '~' in line and '(' in line and ')' in line: #호기:4-1(시간~시간)
        start_time = line.split('(')[1].split('~')[0].strip()
        end_time = line.split('~')[1].split(')')[0].strip()
        return "시작시간 : " + start_time + '\n' + "끝시간 : " + end_time + '\n'
    elif line.count('-') == 2 and '(' in line and ')' in line: #호기:4-1(시간-시간)
        split_parts = line.split('-')
        start_time = split_parts[1].split('(')[1].strip()
        end_time = split_parts[2].split(')')[0].strip()
        return "시작시간 : " + start_time + '\n' + "끝시간 : " + end_time + '\n'
    elif '(' in line and ')' in line : #호기:4-1(시간)
        start_time = line.split('(')[1].split(')')[0].strip()
        end_time = 'N/A'
        return "시작시간 : " + start_time + '\n' + "끝시간 : " + end_time + '\n'
    elif '~' in line and '[' in line and ']' in line: #호기:4-1[시간~시간]
        start_time = line.split('[')[1].split('~')[0].strip()
        end_time = line.split('~')[1].split(']')[0].strip()
        return "시작시간 : " + start_time + '\n' + "끝시간 : " + end_time + '\n'
    elif line.count('-') == 2 and '[' in line and ']' in line: #호기:4-1(시간-시간)
        split_parts = line.split('-')
        start_time = split_parts[1].split('[')[1].strip()
        end_time = split_parts[2].split(']')[0].strip()
        return "시작시간 : " + start_time + '\n' + "끝시간 : " + end_time + '\n'
    else:
        start_time = 'N/A'
        end_time = 'N/A'
        return "시작시간 : " + start_time + '\n' + "끝시간 : " + end_time + '\n'




# 입력 파일 열기
with open(input_file_path, 'r', encoding='utf-8') as input_file:
    # 파일 내용 읽기
    lines = input_file.readlines()

# 새로운 내용을 저장할 리스트 생성
new_lines = []

# 각 라인에 대해 처리
for line in lines:
    if "호기" in line and "현상" not in line and "원인" not in line and "조치사항" not in line and "조치인원" not in line:
        line = line.replace(' ', '')        #그라인에 호기는 포함되지만 현상 원인 조치사항 조치인원은 포함안될때만
        line = '호기 : ' + '#' +machine_line(line) + '\n' + start_end_time(line)
        new_lines.append(line)
    elif "조치인원 :" in line or "조치인원:" in line:
        if "." in line:
            line = line.replace(".","")
            new_lines.append(line)
        else:
            new_lines.append(line)
    else:
        new_lines.append(line)


# 출력 파일에 쓰기
with open(output_file_path, 'w', encoding='utf-8') as output_file:
    output_file.writelines(new_lines)
#-----------------------------------------------------------------
    
#  1.  단락으로 구분짓고
#  2.  1~4호기 단락 남기고
#  3.  8줄 안되는 단락 골라서 프린트해주는 코드  

with open('output3.txt', 'r', encoding='utf-8') as input_file:
    # 파일 내용 읽기
    text = input_file.read()

# 텍스트를 각각의 단락으로 나누기
paragraphs = text.split('\n\n')
paragraphs.pop() #output3 보면 맨아래에 두줄 공백있는데 그것때매 하나 더 카운트해서 그냥 paragraphs라는 리스트에서 마지막 요소인 공백을 빼주는거임
paragraphs = [s for  # 1호기부터 4호기까지만
 s in paragraphs if '#5-1' not in s and
 '#5-2' not in s and
 '#6-1' not in s and
 '#6-2' not in s and
 '#7-1' not in s and
 '#7-2' not in s and
 '#8-1' not in s and
 '#8-2' not in s]
x=0
y=0
with open('error.txt', 'w', encoding='utf-8') as file:  #error 텍스트파일 생성
    for i, paragraph in enumerate(paragraphs, start=1):
        y = y + 1
        # 현재 단락을 개행문자로 나누어 줄 수를 세기
        num_lines = len(paragraph.split('\n'))
        if num_lines != 8 :  #8줄이 안되면  
            file.write(f"This paragraph consists of {num_lines} lines\n") # 각 단락의 줄 수를 출력
            file.write(paragraph)
            file.write('\n\n')
            x = x + 1
    a = str(x) + ' out of ' + str(y)
    file.write(a)
with open(output_file_path, 'w', encoding='utf-8') as output_file:
    for item in paragraphs:
        output_file.write(item + '\n\n')

#------------------------------------------------------------------
#엑셀로 ㄱㄱ  


import pandas as pd
from io import StringIO
import sys

# 입력 파일 열기
with open('output3.txt', 'r', encoding='utf-8') as input_file:
    # 파일 내용 읽기
    text = input_file.read()


# Split the text into lines
lines = text.strip().split('\n')
#print(lines)
# Initialize lists to store key-value pairs
data_dict = {}

# Iterate through lines and extract key-value pairs
for line in lines:
    if line.strip() != '': # 빈줄이 아니면
        if '호기 :' not in line and '현상 :' not in line and '원인 :' not in line and '조치사항 :' not in line and '조치인원 :' not in line and '호기:' not in line and '현상:' not in line and '원인:' not in line and '조치사항:' not in line and '조치인원:' not in line and '시작시간 :' not in line and '끝시간 :' not in line and '날짜 :' not in line: #빈줄이 아니고 이게 다 없으면 ( '■이름 : 고형우' 이런식으로 안쓰고 '■고형우 이런식으로 썼단얘기임
            
            if '호기 :' in pre_line or '호기:' in pre_line : 
                key, value = '시작시간' , line.strip()
                if key not in data_dict:
                    data_dict[key] = []
                data_dict[key].append(value)
            elif '시작시간 :' in pre_line : 
                key, value = '끝시간' , line.strip()
                if key not in data_dict:
                    data_dict[key] = []
                data_dict[key].append(value)
            
            elif '끝시간 :' in pre_line :
                key, value = '현상' , line.strip()
                if key not in data_dict:
                    data_dict[key] = []
                data_dict[key].append(value)
            
            elif '현상 :' in pre_line or '현상:' in pre_line : 
                key, value = '원인' , line.strip()
                if key not in data_dict:
                    data_dict[key] = []
                data_dict[key].append(value)
           
            elif '원인 :' in pre_line or '원인:' in pre_line : 
                key, value = '조치사항' , line.strip()
                if key not in data_dict:
                    data_dict[key] = []
                data_dict[key].append(value)
          
            elif '조치사항 :' in pre_line or '조치사항:' in pre_line : 
                key, value = '조치인원' , line.strip()
                if key not in data_dict:
                    data_dict[key] = []
                data_dict[key].append(value)
        else:    
            key, value = map(str.strip, line.split(':', 1))
            if key not in data_dict:
                data_dict[key] = []
            data_dict[key].append(value)
    pre_line = line
# Create a DataFrame from the dictionary
data = pd.DataFrame(data_dict)




# Swap E열 and F열
data['조치사항'], data['원인'] = data['원인'].copy(), data['조치사항'].copy()

 # Rename columns 'E열' and 'F열' to new names
data = data.rename(columns={'조치사항': '원인', '원인': '조치사항'})


# Save to Excel
data.to_excel("output.xlsx", index=False)


# 엑셀 파일 열기
from openpyxl import load_workbook

book = load_workbook("output.xlsx")
writer = pd.ExcelWriter("output.xlsx", engine='openpyxl')

# 시트 선택
sheet = book.active


# D, E, F 열에 대해 너비 설정
columns_to_adjust = ['D', 'E', 'F']
for col in columns_to_adjust:
    sheet.column_dimensions[col].width = 35

# 저장
book.save("output.xlsx")
