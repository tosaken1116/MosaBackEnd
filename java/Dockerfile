FROM openjdk:17-alpine

RUN mkdir -p /opt/java
COPY . /opt/java/

WORKDIR /opt/java/api

RUN chmod +x ./gradlew

RUN ./gradlew build 

CMD [ "java", "-jar", "build/libs/api-0.0.1-SNAPSHOT.jar" ]
