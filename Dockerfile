FROM python:3.8-alpine
MAINTAINER Knavels Dev

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

RUN mkdir /app
WORKDIR /app
COPY ./app /app

RUN python manage.py makemigrations
RUN python manage.py migrate

RUN adduser -D user
USER user

