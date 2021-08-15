FROM python:3.9-alpine

MAINTAINER Saeed Hassan


ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt

RUN apk update && apk add python3-dev \
                        gcc \
                        libc-dev
RUN apk add --update --no-cache postgresql-client jpeg-dev
RUN apk add --update --no-cache --virtual .tmp-build-deps \
      gcc libc-dev linux-headers postgresql-dev musl-dev zlib zlib-dev \
      make git libffi-dev openssl-dev python3-dev libxml2-dev libxslt-dev

RUN pip install --upgrade pip

RUN pip install -r /requirements.txt
RUN apk del .tmp-build-deps

RUN mkdir /app
WORKDIR /app
COPY ./app /app

RUN adduser -D user

USER user
# CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
