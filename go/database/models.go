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
	User     User `gorm:"foreignKey:UserID;reference:ID" json:"user"`
}

type Reply struct {
	ID        string `gorm:"primaryKey"`
	PostID    string
	UserID    string
	Content   string `gorm:"not null"`
	CreatedAt string
}

type LikePost struct {
	Likes
	Post
}

type User struct{
	ID string `gorm:"primaryKey"`
	Name string
	Email string
	ImageUrl string
}