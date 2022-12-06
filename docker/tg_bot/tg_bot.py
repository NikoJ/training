import logging

import os 
import pandas as pd
from aiogram import Bot, Dispatcher, executor, types
from clickhouse_driver import Client

logging.basicConfig(
    format="%(levelname)s: %(asctime)s - %(message)s",
    datefmt="%d-%b-%y %H:%M:%S",
    level=logging.INFO
)

APP_TOKEN = os.environ.get("APP_TOKEN")

connection = Client(
    host="localhost",
    port="9000",
    database="todo",
    user="default",
    password="" # for test
)

bot = Bot(token=APP_TOKEN)
dp = Dispatcher(bot)

@dp.message_handler(commands="all")
async def all_task(payload:types.Message):
    data = connection.execute("SELECT * FROM todo.todo")
    await payload.reply(f"```{pd.DataFrame(data, columns=['text','status']).to_markdown()}```", parse_mode="Markdown")

@dp.message_handler(commands="add")
async def add_task(payload:types.Message):
    text = payload.get_args().strip()

    connection.execute(
        "INSERT INTO todo.todo (text,status) VALUES (%(text)s,%(status)s)",
        {"text":text, "status":"active"}
    )

    logging.info(f"Added task to csv - {text}")
    await payload.reply(f"Added task: *{text}*", parse_mode="Markdown")


@dp.message_handler(commands="done")
async def complete_task(payload:types.Message):
    text = payload.get_args().strip()
    
    connection.execute(
        "ALTER TABLE todo.todo UPDATE status='complete' WHERE text=%(text)s",
        {"text":text}
    )

    logging.info(f"Performed task - {text}")
    await payload.reply(f"Performed: *{text}*", parse_mode="Markdown")


if __name__ == "__main__":
    executor.start_polling(dp)