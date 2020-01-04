#!/bin/sh

# build project
go build -mod=readonly -v

# run linters'
golangci-lint run --new-from-rev=$(git rev-parse origin/master) --config .golangci.yml --build-tags=integration

# run tests
go test ./...
