use actix_web::{HttpResponse,get};

#[get("/")]
pub async fn health_check()-> HttpResponse {
    HttpResponse::Ok().body("Hello, Kizuku!!!!!!")
}
