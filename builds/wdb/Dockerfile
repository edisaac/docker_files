FROM alpine:3.4
#FROM python:3.6-alpine

MAINTAINER edisaac S.A. <edisaac.mejia@gmail.com>

RUN set -ex \
	&& apk add --no-cache --virtual .fetch-deps \
	python \
  	python-dev \
  	py-psutil \
  	py-pip 

RUN pip install wdb.server

EXPOSE 1984 19840

CMD ["wdb.server.py --log_to_stderr"]

