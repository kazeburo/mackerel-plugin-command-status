VERSION=0.0.2
LDFLAGS=-ldflags "-w -s -X main.version=${VERSION} "

all: mackerel-plugin-command-status

.PHONY: mackerel-plugin-command-status

mackerel-plugin-command-status: main.go
	go build $(LDFLAGS) -o mackerel-plugin-command-status main.go

linux: main.go
	GOOS=linux GOARCH=amd64 go build $(LDFLAGS) -o mackerel-plugin-command-status main.go

check:
	go test ./...

fmt:
	go fmt ./...

tag:
	git tag v${VERSION}
	git push origin v${VERSION}
	git push origin master
