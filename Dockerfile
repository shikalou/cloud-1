FROM debian:bookworm

RUN mkdir -p cloud-1

RUN apt update -y && apt upgrade -y

RUN apt install -y sudo vim python3 curl ansible

COPY inception ./cloud-1/inception
COPY playbook  ./cloud-1/playbook