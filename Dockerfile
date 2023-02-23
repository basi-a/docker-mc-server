FROM debian:11

ARG TAG
LABEL version=$TAG
LABEL maintainer="basi-a <basi-a@outlook.com>"
LABEL description="A Docker image for Minecraft server"

WORKDIR /minecraft
EXPOSE 25565

COPY script/* /minecraft/script/
COPY example/* /minecraft/game/

RUN sed -i.bak "s|eula=false|eula=true|g" /minecraft/game/eula.txt && \
    sed -i.bak "s|online-mode=true|online-mode=false|g" /minecraft/game/server.properties && \
    chmod 0744 /minecraft/script/download.sh /minecraft/script/start.sh && \
    ln -s /minecraft/script/start.sh /usr/local/bin/start-server && \
    /minecraft/script/download.sh && \
    rm -rf /var/lib/apt/lists/*

VOLUME /minecraft/game

CMD [ "start-server" ]
