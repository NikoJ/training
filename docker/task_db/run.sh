# Run Clickhouse
docker run --rm -d -p 8123:8123 -p 9000:9000 --name ch_db yandex/clickhouse-server

# Run PostgreSQL
docker run  -d \
            --rm \
            --name some-postgres \
            -e POSTGRES_PASSWORD=admin \
            -e POSTGRES_USER=admin \
            -e POSTGRES_DB=todo_db \
            -p 5432:5432 \
            postgres

# -e PGDATA=/var/lib/postgresql/data/pgdata \
	# -v /custom/mount:/var/lib/postgresql/data \


# Run Superset
docker pull apache/superset

# 1. Start a superset instance on port 8080
docker run  -d \
            -p 8080:8088 \
            --name superset \
            apache/superset

# 2. Setup your local admin account
docker exec -it superset superset fab create-admin \
              --username admin \
              --firstname Superset \
              --lastname Admin \
              --email admin@superset.com \
              --password admin

# 3. Migrate local DB to latest
docker exec -it superset superset db upgrade

# 4. Setup roles
docker exec -it superset superset init