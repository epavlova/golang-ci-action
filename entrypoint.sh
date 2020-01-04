#!/bin/sh -l

echo "hello"
ls -l
go build -mod=readonly -v
