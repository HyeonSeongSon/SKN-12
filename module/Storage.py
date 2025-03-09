import json   # 딕셔너리 형태의 객체를 문자열로 저장하고 다시 객체로 만듦
# 객체의 모든 데이터를 딕셔너리로 변환한 후 json을 이용해서 문자열형태로 파일에 저장
def save_students(students, filename = '/content/drive/MyDrive/data/student.json'):
  data = [student.to_dict() for student in students]
  with open(filename,'w',encoding='utf-8') as f:
    json.dump(data,f,ensure_ascii=False, indent = 2)  # ensure_ascii = 한글깨짐 방지, indent = 들여쓰기 칸수

# jsom형태(문자열로 된 dict)된 문자열을 읽어서 실제 객체로 반환 --> 리스트
def load_students(filename = '/content/drive/MyDrive/data/student.json'):
  with open(filename,'r',encoding='utf-8') as f:
    data = json.load(f)
  return data
