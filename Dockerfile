FROM python:2.7-slim

MAINTAINER Kimmo Brunfeldt

ENV VERSION=1.4.2
RUN pip install b2==${VERSION}

COPY files/entrypoint.sh /entrypoint.sh
COPY files/upload_file_replace.py /usr/bin/b2_upload_file_replace

WORKDIR /root
ENTRYPOINT [ "/entrypoint.sh" ]
