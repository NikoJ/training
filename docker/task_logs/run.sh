docker build -t logs_ex .

docker run --rm --name file logs_ex file

docker run -d --name console logs_ex console
docker logs console
# -f, --follow
# -t, --timestamp
docker logs -f console
docker logs -t console

docker inspect --format "{{.LogPath}}" console
sudo cat $(docker inspect --format "{{.LogPath}}" console)

docker run --name lib logs_ex lib
docker logs lib 2>&1 | head -5
