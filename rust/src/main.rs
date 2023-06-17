use actix_web::{App,HttpServer};
use rust::handler::{group::invite_group, post:: post_post, health::health_check};

#[actix_web::main]
async fn main()-> std::io::Result<()>{
    HttpServer::new(|| App::new().service(invite_group).service(post_post).service(health_check))
    .bind(("0.0.0.0", 8080))?
    .run()
    .await
}