FROM maven:3.6.3-jdk-8 AS build-env
WORKDIR /app

COPY pom.xml ./
RUN mvn dependency:go-offline


COPY . ./

RUN mvn package -DfinalName=addressbook



FROM tomcat
WORKDIR /usr/local/tomcat/webapps/


COPY --from=build-env /app/target/addressbook.war ./addressbook.war

