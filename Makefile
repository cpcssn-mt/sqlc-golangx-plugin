.PHONY: build test

build:
	go build ./...

test: bin/sqlc-golangx-plugin.wasm
	go test ./...

all: bin/sqlc-golangx-plugin bin/sqlc-golangx-plugin.wasm

bin/sqlc-golangx-plugin: bin go.mod go.sum $(wildcard **/*.go)
	cd plugin && go build -o ../bin/sqlc-golangx-plugin ./main.go

bin/sqlc-golangx-plugin.wasm: bin/sqlc-golangx-plugin
	cd plugin && GOOS=wasip1 GOARCH=wasm go build -o ../bin/sqlc-golangx-plugin.wasm main.go

bin:
	mkdir -p bin
