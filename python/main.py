from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from db.models import Base
from db.database import engine
from routers.main import router

Base.metadata.create_all(bind=engine)

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_credentials=True,
    allow_origins=["*"],
    allow_methods=["*"],
    allow_headers=["*"],
)


@app.get("/")
def read_root():
    return {"Hello": "World"}

app.include_router(router, prefix="/api/v1")