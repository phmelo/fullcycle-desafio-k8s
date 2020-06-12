# FROM gcr.io/cloud-builders/go AS builder
FROM golang:alpine as builder

WORKDIR /go/src/server
COPY src/*.go /go/src/server/

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags="-w -s" -o /go/bin/server

FROM scratch

COPY --from=builder /go/bin/server /server

EXPOSE 8000

ENTRYPOINT [ "/server"]
