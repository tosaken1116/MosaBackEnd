package database

type Likes struct {
	PostsId string  `gorm:"not null" json:"-"`
	UserId  string  `gorm:"not null" json:"-"`
}