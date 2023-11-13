
change the code to JDK 17 compatible 


## Docker build


linux 

### paketo

paketo default java is 17 now , need to override it --env "BP_JVM_VERSION=21
However it does not work

docker run \
-v /var/run/docker.sock:/var/run/docker.sock \
-v $PWD:/workspace -w /workspace \
--env BP_JVM_VERSION=21 \
buildpacksio/pack build javadocker101:buildpack --builder  paketobuildpacks/builder-jammy-full


### heroku

heroku default jdk is 11

docker run \
-v /var/run/docker.sock:/var/run/docker.sock \
-v $PWD:/workspace -w /workspace \
buildpacksio/pack build javadocker101:buildpack --builder   heroku/builder:22


## Manual build

[pack release](https://github.com/buildpacks/pack/releases)

Check suggested builder D:\tools\pack\pack.exe builder suggest

D:\tools\pack\pack.exe build javadocker101:buildpack  --env BP_JVM_VERSION=21  --builder  paketobuildpacks/builder-jammy-full


## Run

docker run -p 8080:8080 javadocker101:buildpack

curl http://localhost:8080