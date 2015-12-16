# Django App Docker container using a minimal ubuntu image see details below:
# http://phusion.github.io/baseimage-docker/

FROM phusion/baseimage:latest
MAINTAINER Pablo Opazo "p@sequel.ninja"

# Perform an unattended installation of a Debian package
ENV DEBIAN_FRONTEND=noninteractive

# Install python3 and dependencies
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y \
    build-essential \
    ca-certificates \
    gcc \
    git \
    libpq-dev \
    make \
    pkg-config \
    python3.4 \
    python3.4-dev \
    && apt-get autoremove \
    && apt-get clean

# Install lastest pip 
ADD https://raw.githubusercontent.com/pypa/pip/5d927de5cdc7c05b1afbdd78ae0d1b127c04d9d0/contrib/get-pip.py /root/get-pip.py
RUN python3.4 /root/get-pip.py
RUN pip3.4 install -U "setuptools==18.4"
RUN pip3.4 install -U "pip==7.1.2"
RUN pip3.4 install psycopg2
