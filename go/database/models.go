package database

type Likes struct {
	PostId string `gorm:"not null" json:"-"`
	UserId string `gorm:"not null" json:"-"`
}
type Post struct {
	ID        string `gorm:"primaryKey"`
	UserID    string
	Content   string `gorm:"not null"`
	CreatedAt string
	UpdatedAt string
	Replies   []Reply `gorm:"foreignKey:PostID"`
}

type Reply struct {
	ID        string `gorm:"primaryKey"`
	PostID    string
	UserID    string
	Content   string `gorm:"not null"`
	CreatedAt string
}
