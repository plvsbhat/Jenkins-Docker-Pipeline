# copy the content from git
FROM alpine as git
RUN apk update && apk add git
WORKDIR /usr/java
RUN git clone https://github.com/anup0453/Java_Multistage_dockerfile.git

# use mvn to create artifac
FROM maven:amazoncorretto as maven
COPY --from=git /usr/java/Java_Multistage_dockerfile/src /usr/app/src
COPY --from=git /usr/java/Java_Multistage_dockerfile/pom.xml /usr/app
RUN mvn -f /usr/app/pom.xml clean install

# deploy application from tomcat
FROM tomcat
WORKDIR webapps
COPY --from=maven /usr/app/target/java-tomcat-maven-example.war .
RUN rm -rf ROOT && mv java-tomcat-maven-example.war ROOT.war
