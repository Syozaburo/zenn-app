FROM node:14.3

WORKDIR /app

ENV LANG C.UTF-8
ENV TZ Asia/Tokyo
ENV HOST 0.0.0.0

RUN apt-get update -y && \
  apt-get upgrade -y && \
  npm install npm@6.14.4 && \
  npm install ejs@3.0.1 &&\ 
  npm install nuxt@2.0.0 &&\
  npm install -g create-nuxt-app@2.15.0 && \
  npm install defu@3.1.0

ADD . /app

EXPOSE 3000

CMD ["npm", "run", "start"]
