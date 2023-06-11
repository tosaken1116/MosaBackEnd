use serde::{Serialize, Deserialize};
use uuid::Uuid;
#[derive(Debug, Serialize, Deserialize)]
pub struct PostInvitation{
    pub group_id: Uuid,
    pub user_id: Uuid,
}