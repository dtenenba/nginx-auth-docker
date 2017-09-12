FROM ubuntu:16.04

RUN apt-get update -y && apt-get install -y python3 python3-pip
RUN pip3 install flask gunicorn ldap3

ADD . /app
WORKDIR /app

CMD gunicorn -w 4 -b 0.0.0.0:8080 app:app
