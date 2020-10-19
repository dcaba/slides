package main

import (
	"fmt"
	"log"

	"gopkg.in/yaml.v2"
)

func main() {
	bucketsMap := map[string]map[string]interface{}{
		"bucketGroup": map[string]interface{}{
			"bucket1": "test1",
			"bucket2": "test2",
		},
	}

	bytes, err := yaml.Marshal(bucketsMap)
	if err != nil {
		log.Fatal(err)
	}

	fmt.Printf("%s", bytes)
}
