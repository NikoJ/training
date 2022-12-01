tree .
docker build -t tg_bot_files .
docker volume create tg_4_vol
docker run --name tg_bot_todolist --rm -e APP_TOKEN=$APP_TOKEN -v tg_4_vol:/app/todo_result tg_bot_files

# For the first run
# docker cp todo_result/ tg_bot_todolist:/app