FROM python:3.12.0b3-alpine3.18

ENV PYTHONUNBUFFERED 1
# WHAT MEANS LIKE PYTHON APPLICATION WILL ALWAYS OUTPUT THE LOGS THAT
# IT PRINTS TO THE CONSOLE STRAIGHT TO THE OUTPUT OF THAT CONTAINER

COPY ./requirements.txt /requirements.txt

# RUN python -m venv env && \
#     python pip install --upgrade pip && \
#     pip install -r /requirements.txt

RUN python -m venv /py && \
    /py/bin/pip install --upgrade pip && \
    /py/bin/pip install -r /requirements.txt



ENV PATH="/py/bin/:$PATH"

COPY ./app /app 
# app jaratip alamiz localda ok
WORKDIR /app
