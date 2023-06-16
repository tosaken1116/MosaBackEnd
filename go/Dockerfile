FROM golang:1.19
RUN mkdir -p /app
COPY . /app
WORKDIR /app

RUN go install

EXPOSE 8080

CMD [ "go", "run", "main.go" ]