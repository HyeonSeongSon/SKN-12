class MyModule2:
  def __init__(self,data):
    self.data = data

  def __str__(self) -> str:
    return f'my_module1 data:{self.data}'