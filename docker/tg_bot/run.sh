# Local run tg bot
# python3 -m venv venv
# source venv/bin/activate
# pip install -r requirements.txt

tree .
docker build -t tg_bot_db .

docker run --name tg_bot_todolist \
           --rm -e APP_TOKEN=$APP_TOKEN
