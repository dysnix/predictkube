GOPATH=$(shell go env GOPATH)

# Setting SHELL to bash allows bash commands to be executed by recipes.
# This is a requirement for 'setup-envtest.sh' in the test target.
# Options are set to exit when a recipe line exits non-zero or a piped command fails.
SHELL = /usr/bin/env bash -o pipefail
.SHELLFLAGS = -ec

INJECT_TAG=github.com/favadi/protoc-go-inject-tag

.PHONY: gen-proto add-tags

gen-proto:
	protoc -I. \
		-I/usr/local/include \
		--go_out=external \
		--go_opt=paths=source_relative \
		--go-grpc_out=external \
		--go-grpc_opt=paths=source_relative \
		proto/**/*.proto

add-tags: gen-proto
	@echo "Processing proto files..."
	go get $(INJECT_TAG)
	go run $(INJECT_TAG) -input=$$(find external -name "*.pb.go")
