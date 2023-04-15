package main

import (
	"bytes"
	"embed"
	"flag"
	"fmt"
	"os"
)

var files = []string{
	".gitignore",
	"CMakeLists.txt",
	"Makefile",
	"module.v",
	"testbench.v",
	"testbench.cpp",
}

//go:embed .gitignore CMakeLists.txt Makefile module.v testbench.v testbench.cpp
var storage embed.FS

func main() {
	name := flag.String("name", "", "Name of the project")
	flag.Parse()

	if *name == "" {
		flag.PrintDefaults()
		return
	}

	err := ensureProjectDir(*name)
	if err != nil {
		fmt.Println(err)
		return
	}

	err = os.Chdir(*name)
	if err != nil {
		fmt.Println(err)
		return
	}

	for _, file := range files {
		data, err := storage.ReadFile(file)
		if err != nil {
			fmt.Println(err)
			return
		}

		data = bytes.ReplaceAll(data, []byte("NAME"), []byte(*name))

		if file == "module.v" {
			file = *name + ".v"
		}

		err = os.WriteFile(file, data, 0644)
		if err != nil {
			fmt.Println(err)
			return
		}
	}
}

// ensureProjectDir creates a directory with the given name
// if it doesn't exist, throws error if exists
func ensureProjectDir(name string) error {
	if _, err := os.Stat(name); os.IsNotExist(err) {
		return os.Mkdir(name, 0755)
	}

	return fmt.Errorf("directory %s already exists", name)
}
