tree .

docker build -t task_volume .

docker run --rm -it task_volume
docker stop $(docker ps -q) && docker rm $(docker ps -qa)

docker run -- rm -it -v $(pwd)/training/docker/task_volume:/app task_volume
docker stop $(docker ps -q) && docker rm $(docker ps -qa)

docker volume create test_vol

docker run --rm -it -v test_vol:/app task_volume
docker cp test.csv suspicious_hugle:/app/test.csv
echo "Test, not active//n" >> test.csv
docker volume inspect test_vol
docker stop $(docker ps -q) && docker rm $(docker ps -qa)