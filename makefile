SHELL := /bin/bash

run:
	go run main.go

build: 
	go build -ldflags "-X main.build=local"

# ==============================================================================
# Building containers

VERSION := 1.0

all: service3-sales

service3-sales:
	docker build \
		-f zarf/docker/dockerfile \
		-t sales-api-amd64:$(VERSION) \
		--build-arg BUILD_REF=$(VERSION) \
		--build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` \
		.
