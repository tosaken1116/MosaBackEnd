use actix_web::{HttpResponse, web::{ self},error::Error,post};

use crate::{cruds::group::make_invitation, schemas::group::PostInvitation};



#[post("/invitation")]
pub async fn invite_group(
    post_json: web::Json<PostInvitation>,)-> Result<HttpResponse, Error> {
    match make_invitation(post_json.user_id, post_json.group_id).await{
        Ok(_) => Ok(HttpResponse::Ok().body("success")),
        Err(_) => Ok(HttpResponse::InternalServerError().body("internal server error")),
    }
}
