FROM alpine:3.12.0

RUN apk add iproute2

WORKDIR /ss/
COPY *.sh ./
