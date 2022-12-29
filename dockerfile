FROM golang:1.19-alpine AS builder

WORKDIR /usr/src/app

COPY . .

RUN go build -v -o ./helloworld .

FROM scratch

WORKDIR /app

COPY --from=builder /usr/src/app/helloworld .

ENTRYPOINT ["./helloworld"]


