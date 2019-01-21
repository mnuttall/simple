package main

import (
	"fmt"
	"log"
	"net/http"
	"sync"
)

type helloHandler struct{}

var invocations int
var lock sync.Mutex

func (h helloHandler) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	lock.Lock()
	defer lock.Unlock()
	invocations++
	fmt.Fprintf(w, "Hello, you are caller %d to URL %s", invocations, r.URL.Path)
	fmt.Printf("Request %d handled\n", invocations)
}

func main() {
	fmt.Printf("Entering ListenAndServe\n")
	err := http.ListenAndServe(":8081", helloHandler{})
	log.Fatal(err)
}
