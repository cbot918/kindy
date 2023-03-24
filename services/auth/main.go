package main

import (
	"fmt"
	"net/http"
	"os"
)

var port string

func Home(w http.ResponseWriter, req *http.Request) {
	w.Write([]byte("home from" + port + "\n"))
}

func Ping(w http.ResponseWriter, req *http.Request) {
	w.Write([]byte("pong from" + port + "\n"))
}

func main() {

	fmt.Println("auth service...")
	args := os.Args
	if len(args) == 1 {
		port = ":8000"
	}
	if len(args) == 2 {
		port = fmt.Sprintf(":" + args[1])
	}

	http.HandleFunc("/", Home)
	http.HandleFunc("/ping", Ping)

	fmt.Println("listening port", port)
	if err := http.ListenAndServe(port, nil); err != nil {
		panic(err)
	}
}
