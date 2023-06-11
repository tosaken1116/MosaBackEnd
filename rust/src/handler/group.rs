use actix_web::{HttpResponse, web::{ self},post,error::Error};

use crate::{cruds::group::make_invitation, schemas::group::PostInvitation};



#[post("/invitation")]
pub async fn invite_group(
    post_json: web::Json<PostInvitation>,)-> Result<HttpResponse, Error> {
    match make_invitation(post_json.user_id, post_json.group_id).await{
        Ok(result) => Ok(result),
        Err(error) => Err(error),
    }
}
