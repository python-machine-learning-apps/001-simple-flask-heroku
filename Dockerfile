FROM python:3.10-slim
ARG port

USER root
COPY . /001-simple-flask-heroku
WORKDIR /001-simple-flask-heroku

ENV PORT=$port

RUN apt-get update && apt-get install -y --no-install-recommends apt-utils \
    && apt-get -y install curl \
    && apt-get install libgomp1

RUN chgrp -R 0 /001-simple-flask-heroku \
    && chmod -R g=u /001-simple-flask-heroku \
    && pip install pip --upgrade \
    && pip install -r requirements.txt
EXPOSE $PORT

CMD gunicorn app:server --bind 0.0.0.0:$PORT --preload
