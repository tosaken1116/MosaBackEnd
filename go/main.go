package main

import (
	"mosa/database"
	"mosa/env"
	router "mosa/routers"

	"github.com/gin-contrib/cors"
	"github.com/gin-gonic/gin"
)

func main() {
	env.LoadEnv()
	r := gin.Default()
	r.Use(cors.Default())
	database.InitDb()
	router.Routes(r)
	r.Run()
}
