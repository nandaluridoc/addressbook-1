FROM maven:3.6.3-jdk-8 AS build-env
WORKDIR /app

COPY pom.xml ./
RUN mvn dependency:go-offline


COPY . ./

RUN mvn package -DfinalName=addressbook



FROM tomcat:8.0-alpine
COPY /app/target/addressbook.war /usr/local/tomcat/webapps
EXPOSE 8080
CMD [“catalina.sh”, “run”]
