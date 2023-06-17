from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm.session import Session
from schemas.schemas import RoomPayload
from cruds.rooms import create_rooms
from cruds import rooms as r
from db.database import get_db

room_router = APIRouter()

@room_router.post("/")
async def reservation_room(pyload: RoomPayload, db:Session = Depends(get_db)):
    if pyload is None:
        raise HTTPException(status_code=400, detail="title is none!")
    room = r.create_rooms(db,pyload.owner_id, pyload.title, pyload.description, pyload.is_public, pyload.group_id, pyload.start_time,pyload.end_time)
    return room
