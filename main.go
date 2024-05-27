package main

import (
	"fmt"
	"github.com/gin-gonic/gin"
	"net/http"
)

func main() {
	fmt.Println("Start application.....")
	router := gin.Default()
	router.LoadHTMLGlob("web/templates/**/*")

	router.GET("/", func(c *gin.Context) {
		c.HTML(http.StatusOK, "index", gin.H{
			"title":   "Main website",
			"content": "This is the HOME page for application.",
		})
	})

	router.GET("/index", func(c *gin.Context) {
		c.HTML(http.StatusOK, "index", gin.H{
			"title":   "Main website",
			"content": "This is the HOME page for application.",
		})
	})

	router.GET("/about", func(c *gin.Context) {
		c.HTML(http.StatusOK, "about", gin.H{
			"title":   "Main website",
			"content": "This is the ABOUT page for application. check contactus for more information",
		})
	})

	router.GET("/services", func(c *gin.Context) {
		c.HTML(http.StatusOK, "services", gin.H{
			"title":   "Main website",
			"content": "This is the SERVICES page for application. check contactus for more information",
		})
	})

	router.GET("/contacts", func(c *gin.Context) {
		c.HTML(http.StatusOK, "contacts", gin.H{
			"title":   "Main website",
			"content": "This is the CONTACTS page for application. check HOME for more information",
		})
	})
	router.Run(":8080")
}
