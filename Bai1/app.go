package main

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"math/rand"
	"net/http"
	"time"
)

type blockcypher struct {
	Height int `json:"height"`
}

func getblock(urlApi string)  int {
    resp, err := http.Get(urlApi)
    if err != nil {
        fmt.Println("No response from request")
    }
    defer resp.Body.Close()
    body, err := ioutil.ReadAll(resp.Body)

	Blockcypher:=blockcypher{}
	jsonErr := json.Unmarshal(body, &Blockcypher)
	if jsonErr != nil {
		fmt.Println(jsonErr)
	}

    return Blockcypher.Height             // convert to string before print
}

func main(){
	for range time.Tick(3*time.Second) {
		blockNode1 := getblock("https://api.blockcypher.com/v1/eth/main")
		blockNode2 := blockNode1+ rand.Intn(10)
		total := blockNode1 - blockNode2
		if  total  == 5 || total == -5 {
			fmt.Println("Sai lech ve block:",total)
		}
	  }
}
