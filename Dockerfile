FROM python:3-alpine as builder

WORKDIR /app

ARG RADICALE_VERSION=3.1.7

RUN apk add --no-cache alpine-sdk libffi-dev
RUN pip install --user radicale[bcrypt]==$RADICALE_VERSION


FROM python:3-alpine

RUN apk add --no-cache apache2-utils

COPY --from=builder /root/.local /root/.local
ENV PATH=/root/.local:$PATH

WORKDIR /app

COPY ./config /etc/radicale/config
COPY ./entrypoint.sh .

ENV USER_FILE=/data/users

VOLUME [ "/data" ]

EXPOSE 5232

CMD [ "/app/entrypoint.sh" ]
