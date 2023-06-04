FROM elixir:1.13.4

RUN apt-get update && apt-get install -y \
    inotify-tools \
    git \
    npm \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN mix local.hex --force && \
  mix archive.install hex phx_new 1.6.15 --force && \
  mix local.rebar --force

WORKDIR /app

COPY . /app
