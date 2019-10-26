# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: Java (glibc support)
# Minimum Panel Version: 0.6.0
# ----------------------------------
FROM	azul/zulu-openjdk-alpine:8-jre

LABEL	author="WGOS" maintainer="wgos@wgos.org"

RUN	apk add --update --no-cache tzdata bash \
	&& adduser -D -h /home/container container \
	&& ln -s /etc/localtime /etc/timezone

USER	container
ENV	USER=container HOME=/home/container

WORKDIR	/home/container

COPY	./entrypoint.sh /entrypoint.sh

CMD	["/bin/bash", "/entrypoint.sh"]
