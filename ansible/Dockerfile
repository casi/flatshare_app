FROM alpine:latest as dev
RUN apk update && apk add ansible openssh
ENV INSTALL_PATH /etc/ansible
RUN mkdir -p $INSTALL_PATH
WORKDIR $INSTALL_PATH
