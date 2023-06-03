FROM php:7.4-cli
RUN mkdir -p /app
COPY . /app
WORKDIR /app


CMD [ "php","-S", "0.0.0.0:80", "./api.php" ]