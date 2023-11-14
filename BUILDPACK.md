
change the code to JDK 17 compatible 


## Docker build


linux 

### paketo

paketo default java is 17 now , need to override it --env "BP_JVM_VERSION=21
However it does not work

docker run \
-v /var/run/docker.sock:/var/run/docker.sock \
-v $PWD:/workspace -w /workspace \
buildpacksio/pack build javadocker101:buildpack  --env BP_JVM_VERSION=21 --builder   paketobuildpacks/builder-jammy-base


### heroku

system.properties set jvm version

docker run \
-v /var/run/docker.sock:/var/run/docker.sock \
-v $PWD:/workspace -w /workspace \
buildpacksio/pack build javadocker101:heroku --env BP_JVM_VERSION=21 --builder   heroku/builder:22


## Manual build

[pack release](https://github.com/buildpacks/pack/releases)

Check suggested builder D:\tools\pack\pack.exe builder suggest

D:\tools\pack\pack.exe build javadocker101:buildpack  --env BP_JVM_VERSION=21  --builder  paketobuildpacks/builder-jammy-full


## Run

docker run --rm -p 8080:8080 javadocker101:buildpack

docker run --rm -p 8080:8080 javadocker101:heroku
curl http://localhost:8080