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