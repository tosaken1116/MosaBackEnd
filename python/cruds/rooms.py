from sqlalchemy.orm.session import Session
from db.models import Room
from schemas.schemas import RoomsBase
from sqlalchemy import VARCHAR,TIMESTAMP
from sqlalchemy.dialects.postgresql import UUID
import datetime

def create_rooms(db: Session, owner_id:str,  title:VARCHAR, description:VARCHAR, is_public:bool, group_id:UUID ,start_time:datetime,end_time:datetime) -> RoomsBase:
    room_orm = Room(
        owner_id = owner_id,
        title = title,
        description = description,
        is_public = is_public,
        group_id = group_id,
        start_time = start_time,
        end_time = end_time,
    )
    db.add(room_orm)
    db.commit()
    db.refresh(room_orm)
    room = RoomsBase.from_orm(room_orm)
    return room


