package main

import (
	"net/http"

	"github.com/labstack/echo"
)

func main() {
  // New echo server
	e := echo.New()

  // Define root path action
	e.GET("/", func(c echo.Context) error {
		return c.String(http.StatusOK, "Hello, Louis!")
	})
	e.Logger.Fatal(e.Start(":8000"))
}
