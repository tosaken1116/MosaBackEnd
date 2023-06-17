use serde::{Serialize, Deserialize};

#[derive(Debug, Serialize, Deserialize)]
pub struct PostPost{
    pub user_id: String,
    pub content: String,
}
