FROM bitnami/laravel
RUN mkdir -p /app
COPY . /app
WORKDIR /app


CMD [ "php", "artisan", "serve","--host=0.0.0.0" ]
