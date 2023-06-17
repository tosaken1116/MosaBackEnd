use crate::{models::posts::{self}, db::database::get_db};
use actix_web::{HttpResponse,error::Error};
use sea_orm::{ ActiveModelTrait, Set};
use uuid::Uuid;
use chrono::prelude::Utc;


pub async fn make_post(user_id:String,content:String)->Result<HttpResponse,Error>{
    let db =  get_db().await;
    let created_time = Utc::now().format("%Y-%m-%dT%H:%M:%S%Z").to_string();

    let new_post = posts::ActiveModel{
        id:Set(Uuid::new_v4()),
        user_id:Set(user_id),
        content:Set(content),
        created_at:Set(created_time.clone()),
        update_at:Set(created_time.clone()),
    };
    match  new_post.insert(&db).await{
        Ok(_) =>Ok(HttpResponse::Ok().json("success")),
        Err(_) =>Ok(HttpResponse::InternalServerError().body("error was occurred with insert post"))
    }
}