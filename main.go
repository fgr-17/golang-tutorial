// al code must belong to a package
package main

import (
	"fmt"
)

func main() {

	var conferenceName string = "Go Conference"
	const conferenceTickets = 50
	var remainingTickets uint = 50

	fmt.Printf("`conferenceTickets` type: %T\n", conferenceTickets)
	fmt.Printf("`remainingTickets` type: %T\n", remainingTickets)
	fmt.Printf("`conferenceName` type: %T\n", conferenceName)

	fmt.Printf("Welcome to %v booking app\n", conferenceName)
	fmt.Printf("Get your tickets here to attend\n")
	fmt.Printf("We have total of %v tickets and %v are still %v available\n", conferenceTickets, conferenceTickets, remainingTickets)

	// arrays: fixed size, same type
	// var bookings = [50]string{"fede", "juancito", "carmencita"}
	var bookings [50]string
	bookings[0] = "fede"
	bookings[1] = "juancito"
	bookings[2] = "carmencita"

	var firstName string
	var lastName string
	var email string
	var userTickets uint

	fmt.Println("Enter your first name: ")
	fmt.Scan(&firstName)
	fmt.Println("Enter your last name: ")
	fmt.Scan(&lastName)
	fmt.Println("Enter your email: ")
	fmt.Scan(&email)
	fmt.Println("Enter number of tickets: ")
	fmt.Scan(&userTickets)

	bookings[len(bookings)-1] = firstName + " " + lastName
	fmt.Printf("The whole array: %v\n", bookings)
	fmt.Printf("The first value: %v\n", bookings[0])
	fmt.Printf("Array type: %T\n", bookings)
	fmt.Printf("Array length: %v\n", len(bookings))

	remainingTickets = remainingTickets - userTickets

	fmt.Printf("Thank you %v %v for booking %v tickets\n", firstName, lastName, userTickets)
	fmt.Printf("You will receive a confirmation email at %v\n", email)
	fmt.Printf("There are %v tickets remaining for %v\n", remainingTickets, conferenceName)

	// slices: dynamic size, same type
	// abstraction of array
	// variable lenght, get sub-array

	var bookingsSlice []string
	// var bookingsSlice = []string{"andres", "juancito", "carmencita"}
	bookingsSlice = append(bookingsSlice, firstName+" "+lastName)
	fmt.Printf("The whole slice: %v\n", bookingsSlice)
	fmt.Printf("The first value: %v\n", bookingsSlice[0])
	fmt.Printf("Slice type: %T\n", bookingsSlice)
	fmt.Printf("Slice length: %v\n", len(bookingsSlice))
}
