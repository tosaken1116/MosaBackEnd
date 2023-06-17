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
#* @param post_id The post ID
#* @param user_id The user ID
#* @serializer unboxedJSON
function(post_id, user_id){
   response <- list(message="",code=200)
   tryCatch(
      {
         result <- dbGetQuery(con, "INSERT INTO LIKES (user_id,post_id) VALUES ($1,$2)", c(user_id, post_id))
         response$code <- 200
         response$message <- "success"
         response
      },
      warning = function(w){
         response$code <- 400
         response$message <- "insert failed"
         response
      }
   )

}