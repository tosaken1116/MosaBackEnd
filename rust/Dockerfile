FROM rust:latest
COPY . ./app
WORKDIR /app
RUN apt update
RUN cargo build --release
