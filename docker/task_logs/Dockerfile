FROM python:3.8
WORKDIR /logs
COPY ./log_console.py ./console
COPY ./log_lib.py ./lib
COPY ./log_file.py ./file
ENTRYPOINT ["python3", "-u"]