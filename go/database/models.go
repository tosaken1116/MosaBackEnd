package database

type Likes struct {
	PostId string `gorm:"not null" json:"-"`
	UserId string `gorm:"not null" json:"-"`
}
