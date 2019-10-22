# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: Java (glibc support)
# Minimum Panel Version: 0.6.0
# ----------------------------------
FROM	azul/zulu-openjdk-alpine:8u222-jre

LABEL	author="WGOS" maintainer="wgos@penek-gaming.ru"

RUN	apk add --no-cache --update bash \
	&& adduser -D -h /home/container container
 
USER	container
ENV	USER=container HOME=/home/container

WORKDIR	/home/container

COPY	./entrypoint.sh /entrypoint.sh

CMD	["/bin/bash", "/entrypoint.sh"]
