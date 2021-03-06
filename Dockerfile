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
USER root
RUN npm install -g bower

#USER bower
RUN chown -R $USER:$GROUP /usr/src/app/node_modules
RUN bower install

ARG maasUrl
ARG explorerIP
ENV maasUrl=${maasUrl}
ENV explorerIP=${explorerIP}

EXPOSE 4201

USER root
CMD [ "http-server", "./app", "-a", "se-iiotbox-explorer", "-p", "4201", "--cors", "-c-1" ]
