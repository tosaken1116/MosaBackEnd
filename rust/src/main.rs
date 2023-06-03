use actix_web::{get,web,App,HttpResponse,HttpServer,Responder};
use serde::{Serialize};

#[derive(Serialize)]
pub struct Response{
    pub message:String
}
#[get("/hello")]
async fn hello_world()-> impl Responder{
    let response = Response{
        message:"Hello world".to_string()
    };
    HttpResponse::Ok().json(response)
}

#[actix_web::main]
async fn main()-> std::io::Result<()>{
    HttpServer::new(|| App::new().service(hello_world).default_service(web::route()))
    .bind(("0.0.0.0", 8080))?
    .run()
    .await
}