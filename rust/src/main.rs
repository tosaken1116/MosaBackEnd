use actix_web::{App,HttpServer};
use rust::handler::group::invite_group;
use serde::{Serialize};

#[actix_web::main]
async fn main()-> std::io::Result<()>{
    HttpServer::new(|| App::new().service(invite_group))
    .bind(("0.0.0.0", 8080))?
    .run()
    .await
}