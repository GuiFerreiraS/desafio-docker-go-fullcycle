FROM golang:alpine3.19 AS builder

WORKDIR /usr/src/app

RUN go mod init example/hello

COPY . .

RUN go build hello.go





FROM hello-world

COPY --from=builder /usr/src/app .

CMD ["./hello"]