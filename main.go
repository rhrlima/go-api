package main

import (
	"github.com/gin-gonic/gin"
	"go-api/routes"
)

func main() {
	router := gin.Default()

	router.GET("/", routes.Home)
	router.GET("/ping", routes.Ping)

	router.Run(":8080")
}
