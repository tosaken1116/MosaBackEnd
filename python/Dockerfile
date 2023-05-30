FROM python:3.10.6

RUN mkdir -p /app
COPY . /app
WORKDIR /app

RUN apt update
RUN pip install pipenv
RUN pipenv install