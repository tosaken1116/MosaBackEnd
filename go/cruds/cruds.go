package cruds

import (
	"mosa/database"
)

func DeleteFavorite(user_id, posts_id string)error {
	result := database.Psql.Where("user_id = ? AND post_id = ?", user_id, posts_id).Delete(&database.Likes{})
	if result != nil{
		return result.Error
	}
	return nil
}

func GetPostDetail(post_id string)(m []*database.Post,err error){
	if	err = database.Psql.Preload("Replies").Preload("User").First(&m, "id = ?", post_id).Error	;err != nil{
		return
	}

	return
}

func GetMyFavorite(user_id string)(m []*database.Post,err error){
	if	err = database.Psql.Table("likes").Select("posts.*").Joins("JOIN posts ON likes.post_id = posts.id").Where("likes.user_id = ?", user_id).Find(&m).Error;err != nil{
		return
	}
	return
}