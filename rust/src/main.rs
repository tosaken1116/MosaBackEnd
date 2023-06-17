use actix_web::{App,HttpServer};
use rust::handler::{group::invite_group, post:: post_post};

#[actix_web::main]
async fn main()-> std::io::Result<()>{
    HttpServer::new(|| App::new().service(invite_group).service(post_post))
    .bind(("0.0.0.0", 8080))?
    .run()
    .await
}