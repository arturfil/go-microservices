FROM golang:1.18-alpine as builder

RUN mkdir /app

COPY authService /app

CMD ["/app/authService"]
