FROM maven:3.6.3-jdk-8 AS build-env
WORKDIR /app

COPY pom.xml ./
RUN mvn dependency:go-offline


COPY . ./
RUN mvn spring-javaformat:apply
RUN mvn package -DfinalName=addressbook

FROM openjdk:8-jre-alpine
EXPOSE 8080
WORKDIR /app

COPY --from=build-env /app/target/addressbook.war ./addressbook.war
CMD ["/usr/bin/java", "-jar", "/app/petclinic.war"]
