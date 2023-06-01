FROM golang:1.16-buster AS builder
RUN mkdir -p /app
COPY . /app
WORKDIR /app

RUN go install