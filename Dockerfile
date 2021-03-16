FROM python:3.9

RUN apt update
RUN apt install -y apache2-utils

RUN python3 -m pip install --upgrade radicale[bcrypt]

WORKDIR /app

COPY ./config /etc/radicale/config
COPY ./entrypoint.sh .

ENV USER_FILE=/data/users

VOLUME [ "/data" ]

CMD [ "/app/entrypoint.sh" ]