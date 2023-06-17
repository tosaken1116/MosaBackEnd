use actix_web::{HttpResponse, web::{ self},post,error::Error};

use crate::{cruds::post::make_post, schemas::post::PostPost};



#[post("/post")]
pub async fn post_post(
    post_json: web::Json<PostPost>,)-> Result<HttpResponse, Error> {
    match make_post(post_json.user_id.clone(), post_json.content.clone()).await{
        Ok(result) => Ok(result),
        Err(error) => Err(error),
    }
}

