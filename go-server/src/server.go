package main

import (
	"fmt"
	"net/http"
)

func main() {
	http.HandleFunc("/", greeting)
	http.ListenAndServe(":8000", nil)
}

func greeting(writer http.ResponseWriter, reqest *http.Request) {
	fmt.Fprintf(writer, "<b>Code.education Rocks!</b>")
}