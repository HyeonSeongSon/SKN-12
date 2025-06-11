from fastapi import FastAPI
app = FastAPI()

# 라우터
@app.get("/hello")
def say_hello(name: str):
    return {"message": f"hello {name}!"}
