FROM node:8
LABEL maintainer="SE <bernard@hotmail.be>"

RUN mkdir -p /usr/src/app

# install app
WORKDIR /usr/src/app

COPY ./package*.json ./
RUN npm install
COPY . .

RUN useradd -ms /bin/bash bower
RUN npm install -g bower

USER bower
RUN bower install

ARG maasUrl
ENV maasUrl=${maasUrl}

EXPOSE 4201

CMD [ "npm", "start" ]
