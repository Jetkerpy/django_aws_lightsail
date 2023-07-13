FROM python:3.10.12-alpine3.18

ENV PYTHONUNBUFFERED 1
# WHAT MEANS LIKE PYTHON APPLICATION WILL ALWAYS OUTPUT THE LOGS THAT
# IT PRINTS TO THE CONSOLE STRAIGHT TO THE OUTPUT OF THAT CONTAINER

COPY ./requirements.txt /requirements.txt

# TOMENDEGI DATABASE USHIN "ALPINE" PACKAGES BOLIP TABILADI OK

RUN apk add --update --no-cache postgresql-client build-base postgresql-dev


# RUN python -m venv env && \
#     python -m pip install --upgrade pip && \
#     python -m pip install -r /requirements.txt

RUN python -m venv /env && \
    /env/bin/python -m pip install --upgrade pip && \
    source /env/bin/activate && \
    /env/bin/python -m pip install -r /requirements.txt


ENV PATH="/env/bin/:$PATH"

COPY ./app /app 

WORKDIR /app
