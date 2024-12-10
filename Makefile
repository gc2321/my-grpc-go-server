ifeq ($(OS), Windows_NT)
    BIN_FILENAME := my-grpc-server.exe
else
    BIN_FILENAME := my-grpc-server
endif

.PHONY: tidy
tidy:
	$(MAKE) go-mod-tidy

.PHONY: clean
clean:
	$(RM) -rf ./bin

.PHONY: build
build: clean
	go build -o ./bin/$(BIN_FILENAME) ./cmd

.PHONY: execute
execute: clean build
	./bin/$(BIN_FILENAME)

go-mod-tidy:
	go mod tidy
