FROM ghcr.io/graalvm/graalvm-community:latest as build
RUN microdnf  install maven -y
WORKDIR /app
COPY . .
RUN mvn -Pnative native:compile

FROM ubuntu:latest

EXPOSE 8080
COPY --from=build  /app/target/javadocker101 /javadocker101
CMD ["/javadocker101"]