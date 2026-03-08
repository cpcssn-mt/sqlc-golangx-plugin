package main

import (
	"github.com/sqlc-dev/plugin-sdk-go/codegen"

	golang "github.com/cpcssn-mt/sqlc-golangx-plugin/internal"
)

func main() {
	codegen.Run(golang.Generate)
}
