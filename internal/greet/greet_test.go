package greet

import "testing"

func TestHello(t *testing.T) {
	t.Parallel()

	tests := []struct {
		name string
		in   string
		want string
	}{
		{name: "default", in: "", want: "Hello, World!"},
		{name: "custom", in: "Go", want: "Hello, Go!"},
	}

	for _, tt := range tests {
		tt := tt
		t.Run(tt.name, func(t *testing.T) {
			t.Parallel()
			got := Hello(tt.in)
			if got != tt.want {
				t.Fatalf("Hello(%q) = %q, want %q", tt.in, got, tt.want)
			}
		})
	}
}
