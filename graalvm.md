
docker build . -t javadocker101:graalvm

docker run  --rm -p 8080:8080 javadocker101:graalvm