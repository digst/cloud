package main

import (
	"net/http"
	"fmt"
)
func root(w http.ResponseWriter, _ *http.Request) {
	w.WriteHeader(http.StatusOK)
	fmt.Fprintf(w, "For The Birds - Pixar\n")
}

func main() {
	http.HandleFunc("/", root)
	http.ListenAndServe(":8080", nil)
}
