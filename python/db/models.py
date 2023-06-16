from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, TIMESTAMP, Boolean, Integer, VARCHAR,ForeignKey
from sqlalchemy.dialects.postgresql import UUID
import uuid


def create_uuid():
    return str(uuid.uuid4())

Base = declarative_base()

class User(Base):
    __tablename__ = "users"
    id = Column(VARCHAR, primary_key = True, default=create_uuid)
    image_url = Column(VARCHAR)
    name = Column(VARCHAR)
    email = Column(VARCHAR, nullable=False)

class Groups(Base):
    __tablename__ = "groups"
    id = Column(VARCHAR, primary_key = True, default=create_uuid)
    owner_id = Column(VARCHAR, ForeignKey("users.id"))
    name = Column(VARCHAR, nullable=False)
    description = Column(VARCHAR, nullable=False)
    create_at = Column(TIMESTAMP)
    is_public = Column(Boolean, default=True)

class Room(Base):
    __tablename__ = "rooms"
    id = Column(UUID(as_uuid=True), primary_key = True, default=create_uuid)
    owner_id = Column(VARCHAR, ForeignKey("users.id"))
    title = Column(VARCHAR, nullable=False)
    description = Column(VARCHAR, nullable=False)
    is_public = Column(Boolean)
    group_id = Column(UUID(as_uuid=True), ForeignKey("groups.id"))
    start_time = Column(TIMESTAMP)
    end_time = Column(TIMESTAMP)
    count = Column(Integer, default=0)