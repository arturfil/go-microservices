FROM golang:1.18-alpine as builder

RUN mkdir /app

COPY listenerService /app

CMD ["/app/listenerService"]

