FROM ubuntu:jammy
WORKDIR /app
COPY script.sh script.sh
RUN echo $(pwd)
ENTRYPOINT ["bash", "script.sh"]