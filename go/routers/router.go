package router

import (
	"mosa/handler"

	"github.com/gin-gonic/gin"
)

func Routes(r gin.IRouter){
	v1 := r.Group("/")
	{
		v1.DELETE("/favorite",handler.HandleDeleteFavorite)
		v1.GET("/posts/:post_id",handler.HandleGetPostDetail)
	}
}