from fastapi import APIRouter
from .rooms import room_router

router = APIRouter()

router.include_router(room_router, prefix="/rooms", tags=["rooms"])