FROM python:3.9-alpine3.16

COPY requirements.txt /temp/requirements.txt
COPY service /service
WORKDIR /service
EXPOSE 8000

RUN pip install -r /temp/requirements.txt

# create user(without password) -> service-user
RUN adduser --disabled-password service-user

# run all commands in docker-container as user -> service-user
USER service-user