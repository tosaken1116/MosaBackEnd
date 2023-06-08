package main

import (
	"mosa/database"
	"mosa/env"
	router "mosa/routers"

	"github.com/gin-gonic/gin"
)

func main(){
	env.LoadEnv()
	r := gin.Default()
	database.InitDb()
	router.Routes(r)
	r.Run()
}