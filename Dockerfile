FROM maven:3.5.4-jdk-8-alpine as maven

COPY pom.xml ./pom.xml

COPY src ./src

RUN mvn dependency:go-offline -B

RUN mvn package

FROM openjdk:8u171-jre-alpine

WORKDIR /java-api

COPY --from=maven target/echo-0.0.1-SNAPSHOT.jar ./echo-0.0.1-SNAPSHOT.jar

CMD ["java", "-jar", "./echo-0.0.1-SNAPSHOT.jar"]