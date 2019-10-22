# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: Java (glibc support)
# Minimum Panel Version: 0.6.0
# ----------------------------------
FROM        azul/zulu-openjdk:8u222

LABEL       author="WGOS" maintainer="wgos@penek-gaming.ru"

RUN apt-get update -y \
 && apt-get install -y iproute2 \
 && useradd -d /home/container -m container
 
USER container
ENV  USER=container HOME=/home/container

USER        container
ENV         USER=container HOME=/home/container

WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh

CMD         ["/bin/bash", "/entrypoint.sh"]
