// Package greet provides simple greeting helpers.
package greet

import "fmt"

// Hello returns a greeting for the given name.
// If name is empty, it greets the world.
func Hello(name string) string {
	if name == "" {
		name = "World"
	}
	return fmt.Sprintf("Hello, %s!", name)
}
