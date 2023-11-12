FROM eclipse-temurin:21-jdk  as build

# install maven

WORKDIR /app
RUN wget https://mirrors.estointernet.in/apache/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz
RUN tar -xvf apache-maven-3.6.3-bin.tar.gz
RUN mv apache-maven-3.6.3 /opt/
RUN ls /opt/apache-maven-3.6.3
COPY  .  .
ENV JAVA_HOME=/opt/java/openjdk
ENV PATH="${PATH}:/opt/apache-maven-3.6.3/bin:/opt/java/openjdk/bin"
RUN  mvn clean package


FROM eclipse-temurin:21-jre-ubi9-minimal
WORKDIR /app
EXPOSE 8080
COPY --from=build /app/target/javadocker101-0.0.1-SNAPSHOT.jar  javadocker101.jar
CMD ["java" , "-jar" , "javadocker101.jar"]

