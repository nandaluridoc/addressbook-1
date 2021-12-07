FROM maven:3.6.3-jdk-11-slim@sha256:68ce1cd457891f48d1e137c7d6a4493f60843e84c9e2634e3df1d3d5b381d36c
WORKDIR /app

COPY pom.xml ./
RUN mvn dependency:go-offline


COPY . ./

RUN mvn package -DfinalName=addressbook



FROM tomcat:8.0-alpine
ADD addressbook.war /usr/local/tomcat/webapps
EXPOSE 8080
CMD [“catalina.sh”, “run”]
