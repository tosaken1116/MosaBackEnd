use std::env;
use dotenv::dotenv;

use sea_orm::{Database, DatabaseConnection};

pub async fn get_db()->DatabaseConnection{
    dotenv().ok();

    let db_uri = match env::var("DATABASE_URL") {
        Ok(value) => value,
        Err(_)=>panic!("can't load environment variable")
    };
    let db = match Database::connect(db_uri).await{
        Ok(value) => value,
        Err(err) => {
            panic!("Failed to connect to database: {}", err.to_string());
        }
    };
    db
}