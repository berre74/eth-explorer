FROM node:12.18.1
LABEL maintainer="SE <bernard@hotmail.be>"

RUN mkdir -p /usr/src/app

# install app
WORKDIR /usr/src/app

COPY . .
RUN npm install

ARG maasUrl
ENV maasUrl=${maasUrl}

EXPOSE 8001

CMD [ "npm", "start" ]