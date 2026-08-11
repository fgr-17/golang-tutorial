// Command hello prints a greeting to stdout.
package main

import (
	"fmt"
	"os"

	"github.com/fgr-17/go-template/internal/greet"
)

func main() {
	name := ""
	if len(os.Args) > 1 {
		name = os.Args[1]
	}
	fmt.Println(greet.Hello(name))
}
