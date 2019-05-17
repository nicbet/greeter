# BUILD
FROM golang:1.12 as builder

WORKDIR /go/src/github.com/nicbet/greeter
COPY . .

RUN go get -d -v ./...
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app .


# RUN
FROM alpine:latest
RUN apk --no-cache add ca-certificates

WORKDIR /root/
COPY --from=builder /go/src/github.com/nicbet/greeter/app .

EXPOSE 8000
CMD ["./app"]

