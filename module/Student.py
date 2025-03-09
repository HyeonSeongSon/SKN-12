class Student:
  def __init__(self, name:str, age:int, scores:dict):
    self.name = name
    self.age = age
    self.scores = scores

  def get_average(self) -> float:
    return sum(self.scores.values())/len(self.scores)

  def __str__(self) -> str:
    return f'{self.name}, {self.age}, {self.scores}'

  # 저장을 위해서 데이터를 dict 구조로 만듦 = json형태
  def to_dict(self):
    return {'name':self.name, 'age':self.age, 'scores':self.scores}

  @classmethod   # 1. 클래스 변수를 다루기 위해서 만들지만, 
  def from_dict(cls, data):   # 2. 객체를 통하지 않아도 되는 메소드는 클래스메소드로 만들어도 좋음
    return cls(data['name'], data['age'], data['scores'])
