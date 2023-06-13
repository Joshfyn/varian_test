FROM python:3.9.7-bullseye
LABEL maintainer="Varian test"

RUN apt-get update && apt-get install -yqq python3-pip npm  \
    fonts-liberation libasound2 libatk-bridge2.0-0 \
    libnspr4 libnss3 lsb-release xdg-utils libxss1 libdbus-glib-1-2 libgbm1 \
    curl unzip wget xvfb procps software-properties-common \
    dirmngr apt-transport-https lsb-release ca-certificates && \
    useradd -m -s /bin/bash robot && \
    rm -rf /var/lib/apt/lists/* \

USER robot
ENV PATH /home/robot/.local/bin:$PATH

COPY requirements.txt /home/robot/requirements.txt
COPY . /home/robot/.

RUN apt-get install nodejs && \
    npm cache clean -f && \
    npm install -g n && \
    n stable

RUN python3 -m pip install --upgrade pip && pip3 install -r /home/robot/requirements.txt  --no-cache-dir

Run npx playwright install && \
    npx playwright install-deps

RUN rfbrowser init

WORKDIR /home/robot
