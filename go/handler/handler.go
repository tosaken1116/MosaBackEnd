package handler

import (
	"fmt"
	"mosa/cruds"
	"mosa/schemas"
	"net/http"

	"github.com/gin-gonic/gin"
)

func HandleDeleteFavorite(c *gin.Context){
	input := new(schemas.DeleteLikes)

	if err := c.ShouldBindJSON(input); err != nil {
		c.JSON(http.StatusUnprocessableEntity, gin.H{
			"message": "parse failed",
		})
	}
	if result := cruds.DeleteFavorite(input.UserId,input.PostId); result != nil{
		c.JSON(http.StatusInternalServerError, gin.H{
			"message": "delete failed",
		})
	}else{
		c.JSON(http.StatusOK, gin.H{
			"message": "delete success",
		})
	}
}

func HandleGetPostDetail(c *gin.Context){
	result,err := cruds.GetPostDetail(c.Param("post_id"))
	if err != nil{
		fmt.Println(err)
		c.JSON(http.StatusInternalServerError, gin.H{
			"message": "get failed",
		})
	}
	c.JSON(http.StatusOK, gin.H{
		"data": result,
	})

}

func HandleGetMyFavorite(c *gin.Context){
	result,err := cruds.GetMyFavorite(c.Param("user_id"))
	if err != nil{
		fmt.Println(err)
		c.JSON(http.StatusInternalServerError, gin.H{
			"message": "get failed",
		})
	}
	c.JSON(http.StatusOK, gin.H{
		"data": result,
	})
}