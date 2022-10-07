FROM golang:1.19.1-alpine AS builder

WORKDIR /app

RUN go mod init github.com/lucasantoniooficial/desafio-go

COPY go.mod ./

COPY *.go ./

RUN go build -o /desafio

FROM scratch

WORKDIR /

COPY --from=builder /desafio /desafio

EXPOSE 8080

ENTRYPOINT [ "/desafio" ]