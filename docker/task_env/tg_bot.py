import logging

import os 
import pandas as pd
from aiogram import Bot, Dispatcher, executor, types

logging.basicConfig(
    format="%(levelname)s: %(asctime)s - %(message)s",
    datefmt="%d-%b-%y %H:%M:%S",
    level=logging.INFO
)

APP_TOKEN = os.environ.get("APP_TOKEN")
PATH_TO_CSV = "todo_result/todo_list.csv"

bot = Bot(token=APP_TOKEN)
dp = Dispatcher(bot)

def get_load_data() -> pd.DataFrame:
    return pd.read_csv(PATH_TO_CSV)

@dp.message_handler(commands="all")
async def all_task(payload:types.Message):
    await payload.reply(f"```{get_load_data().to_markdown()}```", parse_mode="Markdown")

@dp.message_handler(commands="add")
async def add_task(payload:types.Message):
    text = payload.get_args().strip()
    new_task = pd.DataFrame({"text":[text], "status":["active"]})
    updated_tasks = pd.concat([get_load_data(), new_task], ignore_index=True, axis=0)

    updated_tasks.to_csv(PATH_TO_CSV, index=False)

    logging.info(f"Added task to csv - {text}")
    await payload.reply(f"Added task: *{text}*", parse_mode="Markdown")


@dp.message_handler(commands="done")
async def complete_task(payload:types.Message):
    text = payload.get_args().strip()
    df = get_load_data()
    df.loc[df.text == text, "status"] = "complete"

    df.to_csv(PATH_TO_CSV, index=False)

    logging.info(f"Performed task - {text}")
    await payload.reply(f"Performed: *{text}*", parse_mode="Markdown")


if __name__ == "__main__":
    executor.start_polling(dp)