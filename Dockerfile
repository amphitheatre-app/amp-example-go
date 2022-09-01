FROM golang:1.18 as builder

WORKDIR /code

COPY main.go .
COPY go.mod .

RUN go build -trimpath -o /app main.go

FROM alpine:3

CMD ["./app"]
COPY --from=builder /app .
