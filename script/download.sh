#!/bin/bash
sed -i "s/deb.debian.org/mirrors.cloud.tencent.com/g" /etc/apt/sources.list
sed -i "s/security.debian.org/mirrors.cloud.tencent.com/g" /etc/apt/sources.list
apt-get clean all && apt-get update
apt install curl screen openjdk-17-jdk -y
URL=$(curl -H 'User-Agent:Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36 Edg/110.0.1587.50' -s https://www.minecraft.net/zh-hans/download/server | grep "server.jar" | awk -F"\"" '{print $2}')
curl -o /minecraft/game/server.jar -L ${URL}
