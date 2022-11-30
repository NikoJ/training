docker run --rm -d --name redis

docker exec -it redis redis-cli

## INSIDE:
SET test "Hi"  # <-- Write data
GET test       # <-- Get data
exit           # <-- Exit the container

docker run --name redis --rm -d \
-v redis_vol:/data redis \
redis-server --appendonly yes

## INSIDE:
SET test "Hi"  # <-- Write data
GET test       # <-- Get data
exit           # <-- Exit the container

docker stop redis

docker run --name redis --rm -d \
-v redis_vol:/data redis \
redis-server --appendonly yes

## INSIDE:
GET test
exit

docker stop redis