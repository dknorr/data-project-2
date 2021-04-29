FROM ubuntu:latest

ADD src/crontab /etc/cron.d/data-poll
ADD src/poll.py .

RUN chmod 0644 /etc/cron.d/data-poll

RUN touch /var/log/cron.log

RUN apt-get update
RUN apt-get -y install cron
RUN apt-get -y install python3.8

RUN cron && tail -f /var/log/cron.log
CMD /bin/bash