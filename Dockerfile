FROM golang:1.13

# install golangci linters' runner
RUN curl -sfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh| sh -s -- -b $(go env GOPATH)/bin v1.18.0

# download linters' config
RUN wget https://raw.githubusercontent.com/Financial-Times/upp-coding-standard/v1.0.0/golangci-config/.golangci.yml

COPY entrypoint.sh /entrypoint.sh
COPY .golangci.yml /.golangci.yml

ENTRYPOINT ["/entrypoint.sh"]
