FROM python:3.8

RUN pip install chalice
RUN chalice new-project lambda-cron
WORKDIR /lambda-cron
RUN rm app.py
RUN rm requirements.txt
WORKDIR /
RUN mkdir .aws

ADD src/app.py lambda-cron/app.py
ADD src/requirements.txt lambda-cron/requirements.txt

WORKDIR /lambda-cron
RUN pip install -r requirements.txt
WORKDIR /lambda-cron

CMD chalice deploy

# FROM ubuntu:latest

# ADD src/crontab /etc/cron.d/data-poll
# ADD src/poll.py .

# RUN chmod 0644 /etc/cron.d/data-poll

# RUN mkdir data
# WORKDIR /data
# RUN touch cron.log
# WORKDIR /

# RUN apt-get update
# RUN apt-get -y install cron
# RUN apt-get -y install python3.8

# RUN crontab /etc/cron.d/data-poll

# CMD cron
# # CMD cron && tail -f /data/cron.log