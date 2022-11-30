# Docker-in-Docker
docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock docker

docker run --rm -d --name redis redis