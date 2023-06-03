FROM openjdk:17-jdk-buster

RUN apt-get update && apt-get install -y findutils

RUN mkdir -p /opt/java/
COPY . /opt/java/

WORKDIR /opt/java/api/

RUN chmod +x ./gradlew

RUN ./gradlew bootJar

CMD [ "./gradlew", "bootRun" ]
