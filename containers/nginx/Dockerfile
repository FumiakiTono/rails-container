FROM nginx:1.19.0-alpine
RUN apk update && \
    apk add --no-cache yarn tzdata libxml2-dev curl-dev make gcc libc-dev g++ mariadb-dev imagemagick6-dev && \
    apk add bind-tools iptables tcpdump nmap && \
    apk del libxml2-dev curl-dev make gcc libc-dev g++
ENV LANG ja_JP.UTF-8
ENV LC_TIME C
ADD ./nginx.conf /etc/nginx/nginx.conf

