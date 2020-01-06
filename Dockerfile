FROM golang:1

# install golangci linters' runner
RUN curl -sfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh| sh -s -- -b $(go env GOPATH)/bin $INPUT_GOLANGCIVERSION

# install goveralls and go-junit-report
RUN GO111MODULE=off go get github.com/mattn/goveralls

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
