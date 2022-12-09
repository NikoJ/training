ifconfig
docker network ls
docker network create -d bridge back_net
docker inspect back_net
docker network rm back_net