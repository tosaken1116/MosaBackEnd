require("RPostgreSQL")
require("dotenv")

load_dot_env(".env")

con <- dbConnect(
   PostgreSQL(),
   host = Sys.getenv("POSTGRES_HOST"),
   port = Sys.getenv("POSTGRES_PORT"),
   dbname = Sys.getenv("POSTGRES_DB"),
   user = Sys.getenv("POSTGRES_USER"),
   password = Sys.getenv("POSTGRES_PASSWORD")
)


#* @post /favorite
function(user_id,post_id){
dataset <-dbGetQuery(con,"INSERT INTO LIKES (user_id,posts_id) VALUES ($1,$2)",c(user_id,post_id))
   dataset
}