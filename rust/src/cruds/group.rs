use crate::{models::invite_groups::{self, Model}, db::database::get_db};
use sea_orm::{ ActiveModelTrait, Set, DbErr};
use uuid::Uuid;


pub async fn make_invitation(user_id:Uuid,group_id:Uuid)->Result<Model,DbErr>{
    let invitation = invite_groups::ActiveModel{
        user_id:Set(user_id),
        group_id:Set(group_id),
    };
    let db =  get_db().await;
    match  invitation.insert(&db).await{
        Ok(result) =>Ok(result),
        Err(err) =>Err(err)
    }
}