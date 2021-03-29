FROM registry.access.redhat.com/ubi8/ubi:latest

RUN dnf install -y jq

COPY assets/ /opt/resource/