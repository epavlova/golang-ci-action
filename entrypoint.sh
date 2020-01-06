#!/bin/sh

# build project
go build -mod=readonly -v

# download linters' config
wget https://raw.githubusercontent.com/Financial-Times/upp-coding-standard/$INPUT_GOLANGCICONFIGVERSION/golangci-config/.golangci.yml

# run linters'
# TODO: important note on running golangci-lint is that the exit code will be 0 even if there are linting errors, this should be fixed
golangci-lint run --new-from-rev=$(git rev-parse origin/master) --config .golangci.yml --build-tags=integration

mkdir /tmp/coverage-results

# run tests
go test -tags=integration -mod=readonly -race -cover -coverprofile=/tmp/coverage-results/coverage.out ./...

# report coverage
goveralls -coverprofile=/tmp/coverage-results/coverage.out -service=circle-ci -repotoken=$INPUT_COVERALLSTOKEN
