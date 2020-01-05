#!/bin/sh

# build project
go build -mod=readonly -v

# download linters' config
wget https://raw.githubusercontent.com/Financial-Times/upp-coding-standard/v1.0.0/golangci-config/.golangci.yml

# run linters'
golangci-lint run --new-from-rev=$(git rev-parse origin/master) --config .golangci.yml --build-tags=integration

# run tests
go test ./...
