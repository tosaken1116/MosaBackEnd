//! `SeaORM` Entity. Generated by sea-orm-codegen 0.11.3

use sea_orm::entity::prelude::*;

#[derive(Clone, Debug, PartialEq, DeriveEntityModel, Eq)]
#[sea_orm(table_name = "users")]
pub struct Model {
    #[sea_orm(primary_key, auto_increment = false)]
    pub id: String,
    pub image_url: Option<String>,
    pub name: Option<String>,
    pub email: String,
}

#[derive(Copy, Clone, Debug, EnumIter, DeriveRelation)]
pub enum Relation {
    #[sea_orm(has_many = "super::groups::Entity")]
    Groups,
    #[sea_orm(has_many = "super::invite_groups::Entity")]
    InviteGroups,
    #[sea_orm(has_many = "super::likes::Entity")]
    Likes,
    #[sea_orm(has_many = "super::posts::Entity")]
    Posts,
    #[sea_orm(has_many = "super::replies::Entity")]
    Replies,
    #[sea_orm(has_many = "super::rooms::Entity")]
    Rooms,
    #[sea_orm(has_many = "super::users_groups::Entity")]
    UsersGroups,
}

impl Related<super::groups::Entity> for Entity {
    fn to() -> RelationDef {
        Relation::Groups.def()
    }
}

impl Related<super::invite_groups::Entity> for Entity {
    fn to() -> RelationDef {
        Relation::InviteGroups.def()
    }
}

impl Related<super::likes::Entity> for Entity {
    fn to() -> RelationDef {
        Relation::Likes.def()
    }
}

impl Related<super::posts::Entity> for Entity {
    fn to() -> RelationDef {
        Relation::Posts.def()
    }
}

impl Related<super::replies::Entity> for Entity {
    fn to() -> RelationDef {
        Relation::Replies.def()
    }
}

impl Related<super::rooms::Entity> for Entity {
    fn to() -> RelationDef {
        Relation::Rooms.def()
    }
}

impl Related<super::users_groups::Entity> for Entity {
    fn to() -> RelationDef {
        Relation::UsersGroups.def()
    }
}

impl ActiveModelBehavior for ActiveModel {}
