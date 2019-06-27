# docker build -f Dockerfile.javascript -t accetto/xubuntu-vnc-javascript .
# docker build -f Dockerfile.javascript --build-arg BASETAG=lab -t accetto/xubuntu-vnc-javascript:lab .

ARG BASETAG=latest

FROM accetto/xubuntu-vnc-node:${BASETAG} as stage-vscode

USER 0

RUN apt-get update && apt-get install -y \
        curl \
        && curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg \
        && install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/ \
        && sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list' \
        && apt-get install apt-transport-https \
        && apt-get update \
        && apt-get install code \
    && apt-get -y autoremove \
    && rm -rf /var/lib/apt/lists/*

### Preconfigure Xfce desktop
COPY [ "./src/home/Desktop", "./Desktop/" ]

### Fix new launchers permissions
RUN gtk-update-icon-cache -f /usr/share/icons/hicolor \
    && /dockerstartup/set_user_permissions.sh $HOME

FROM stage-vscode as stage-typescript

RUN npm install -g typescript

FROM stage-typescript as stage-loopback

RUN npm install -g @loopback/cli

EXPOSE 3000

FROM stage-loopback as stage-final

ENV REFRESHED_AT 2019-06-27

WORKDIR /usr/src

USER 1001
