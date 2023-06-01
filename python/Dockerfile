FROM python:3.10.6

RUN mkdir -p /app
COPY . /app
WORKDIR /app

RUN apt update
RUN apt install -y libpq-dev build-essential
RUN pip install pipenv
RUN pipenv install --system
RUN pipenv install --skip-lock

CMD ["uvicorn", "main:app", "--reload", "--host", "0.0.0.0", "--port", "8080"]