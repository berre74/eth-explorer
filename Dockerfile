FROM node:12
LABEL maintainer="SE <bernard@hotmail.be>"

RUN mkdir -p /usr/src/app

# install app
WORKDIR /usr/src/app

COPY ./package*.json ./
RUN npm install
COPY . .

RUN npm install -g http-server

RUN useradd -ms /bin/bash bower
RUN npm install -g bower

USER bower
RUN chown -R $USER:$GROUP /usr/src/app/node_modules
RUN bower install

ARG maasUrl
ENV maasUrl=${maasUrl}

EXPOSE 4201

USER root
CMD [ "http-server", "./app", "-a", "172.16.238.109", "-p", "4201", "-c-1" ]
