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

#' @filter cors
cors <- function(req, res) {
  
  res$setHeader("Access-Control-Allow-Origin", "*")
  
  if (req$REQUEST_METHOD == "OPTIONS") {
    res$setHeader("Access-Control-Allow-Methods","*")
    res$setHeader("Access-Control-Allow-Headers", req$HTTP_ACCESS_CONTROL_REQUEST_HEADERS)
    res$status <- 200 
    return(list())
  } else {
    plumber::forward()
  }
}


#* @post /favorite
#* @param post_id The post ID
#* @param user_id The user ID
#* @serializer unboxedJSON
function(post_id, user_id){
   response <- list(message="",code=200)
   tryCatch(
      {
         query <- sprintf("INSERT INTO likes (post_id, user_id) VALUES ('%s','%s')", post_id, user_id)
         result <- dbGetQuery(con, query)
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