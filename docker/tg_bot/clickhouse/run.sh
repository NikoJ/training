docker build -t custom_clickhouse .

docker run  --rm \
            -d \
            -p 8123:8123 \
            -p 9000:9000 \
            --name ch_db \
            custom_clickhouse

# docker exec -it ch_db clickhouse-client