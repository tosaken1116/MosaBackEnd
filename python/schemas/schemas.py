from pydantic import BaseModel, Field
from uuid import UUID
from datetime import datetime
from sqlalchemy import VARCHAR, TIMESTAMP

class UserBase(BaseModel):
    id: str
    name: str

    class Config:
        allow_population_by_field_name = True
        arbitrary_types_allowed = True

class RoomsBase(BaseModel):
    id: UUID
    owner_id: str
    title: str
    description: str
    is_public: bool
    group_id: UUID
    start_time: datetime
    end_time: datetime
    count: int

    class Config:
        orm_mode = True 
        allow_population_by_field_name = True
        arbitrary_types_allowed = True

class RoomPayload(BaseModel):
    owner_id: str
    title: str
    description: str
    is_public: bool
    group_id: UUID
    start_time: datetime
    end_time: datetime

    class Config:
        orm_mode = True 
        allow_population_by_field_name = True
        arbitrary_types_allowed = True

class GroupBase(BaseModel):
    id: str
    owner_id: str
    name: str
    description: str
    created_at: datetime
    is_public: bool

    class Config:
        allow_population_by_field_name = True
        arbitrary_types_allowed = True