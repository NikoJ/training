# Вариант с ошибкой
docker run -d --rm --name ch_db yandex/clickhouse-server

docker ps

curl localhost:8123

sudo netstat -tuplen | grep 8123

# Рабочий вариант
docker run -d --rm --name ch_db_port -p 8123:8123 yandex/clickhouse-server

curl localhost:8123

sudo netstat -tuplen | grep 8123

docker history postgres | grep EXPOSE

docker run -p 80:80 -p 81:80 -p 82:80 nginx

# EXPOSE 80/tcp
# EXPOSE 80/udp