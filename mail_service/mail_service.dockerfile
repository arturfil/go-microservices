FROM golang:1.18-alpine as builder

RUN mkdir /app

COPY mailService /app
COPY templates /templates

CMD ["/app/mailService"]
