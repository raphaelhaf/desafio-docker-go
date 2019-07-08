FROM golang:alpine AS builder
WORKDIR $GOPATH/src/myapp

COPY . .

RUN CGO_ENABLED=0 go build -ldflags="-s -w"  -o $GOPATH/bin/hello hello.go


# creating a blank image

FROM scratch

COPY --from=builder /go/bin/hello /hello

CMD ["/hello"]