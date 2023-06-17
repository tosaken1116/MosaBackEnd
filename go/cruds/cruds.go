package cruds

import (
	"fmt"
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
	fmt.Println(post_id)
	if	err = database.Psql.Preload("Replies").First(&m, "id = ?", post_id).Error	;err != nil{
		// if err = database.Psql.Where("id = ?",post_id).Preload("Replies").Find(&m).Error;err != nil{
		return
	}

	return
}