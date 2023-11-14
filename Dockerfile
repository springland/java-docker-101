FROM ghcr.io/graalvm/graalvm-community:latest as build
RUN microdnf  install maven -y
WORKDIR /app
COPY . .
RUN mvn -Pnative native:compile

FROM scratch
WORKDIR /app
EXPOSE 8080
COPY --from=build  /app/target/javadocker101 /app/javadocker101
ENTRYPOINT ["./javadocker101"]