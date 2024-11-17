package routes

import (
	"github.com/gin-gonic/gin"
	"net/http"
)

func Home(c *gin.Context) {
	c.JSON(http.StatusOK, gin.H {
		"message": "Hello World",
	})
}

func Ping(c *gin.Context) {
	c.JSON(http.StatusOK, gin.H {
		"message": "pong",
	})
}
