use crate::{models::invite_groups::{self}, db::database::get_db};
use actix_web::{HttpResponse,error::Error};
use sea_orm::{ ActiveModelTrait, Set, EntityTrait};
use uuid::Uuid;


pub async fn make_invitation(user_id:Uuid,group_id:Uuid)->Result<HttpResponse,Error>{
    let db =  get_db().await;
    let invitation_exist = match invite_groups::Entity::find_by_id((user_id,group_id)).one(&db).await{
        Ok(value) => value,
        Err(_) => return Ok(HttpResponse::InternalServerError().body("error was occurred with check invitation exist"))
    };
    if invitation_exist != None{
        return Ok(HttpResponse::Conflict().body("invitation is already exist"))
    }
    // println!(invitation_exist);
    let invitation = invite_groups::ActiveModel{
        user_id:Set(user_id),
        group_id:Set(group_id),
    };
    match  invitation.insert(&db).await{
        Ok(result) =>Ok(HttpResponse::Ok().json(&result)),
        Err(_) =>Ok(HttpResponse::InternalServerError().body("error was occurred with insert invitation"))
    }
}