# Base image
FROM gcc:latest

# Set working directory
WORKDIR /usr/src/app

# Copy the source code to the container
COPY . .

# Compile the code
RUN g++ -o main main.cpp
