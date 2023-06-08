package database

import (
	"fmt"
	"log"
	"mosa/env"

	"gorm.io/driver/postgres"
	"gorm.io/gorm"
)

var (
	Psql *gorm.DB
)
func InitDb() (err error){
	dsn := fmt.Sprintf(
		"host=%s user=%s password=%s dbname=%s port=%s",
		env.DbHost,
		env.DbUser,
		env.DbPass,
		env.DbName,
		env.DbPort,
	)
	Psql, err = gorm.Open(postgres.Open(dsn), &gorm.Config{})
	if err != nil {
		log.Fatal(err)
	  }
	if err := Psql.AutoMigrate(&Users{},&Likes{},&Posts{}); err != nil {
		log.Fatal(err)
	}

	return nil
}