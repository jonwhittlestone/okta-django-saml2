FROM python:3.6
LABEL author="Howapped Ltd"

ENV PYTHONUNBUFFERED 1

# Install xmlsec1
RUN echo 'deb http://mirror.isoc.org.il/pub/ubuntu/ trusty main universe' >> /etc/apt/sources.list && \
    apt-get update && \
    apt-get -y --no-install-recommends install xmlsec1

COPY ./requirements.txt /requirements.txt
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

RUN mkdir /app
WORKDIR /app
COPY ./django_project /app