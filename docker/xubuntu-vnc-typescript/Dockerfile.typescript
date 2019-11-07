# ./hooks/build dev
# ./hooks/build dfw
# ./hooks/build nux
# ./hooks/build nux --no-cache
# ./hooks/build dev-chromium
# ./hooks/build dfw-chromium
# ./hooks/build nux-chromium
# ./hooks/build dev-firefox
# ./hooks/build dfw-firefox
# ./hooks/build nux-firefox

ARG BASETAG=latest

FROM accetto/xubuntu-vnc-node:${BASETAG} as stage-vscode

USER 0

### 'apt-get clean' runs automatically
RUN \
    curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg \
    && install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/ \
    && sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list' \
    && apt-get update && apt-get install -y \
        apt-transport-https \
        code \
    && apt-get -y autoremove \
    && rm -rf /var/lib/apt/lists/*

### Preconfigure Visual Studio Code
COPY [ "./src/home/config/Code/User", "${HOME}/.config/Code/User" ]

### Preconfigure Xfce desktop
COPY [ "./src/home/Desktop", "${HOME}/Desktop/" ]
COPY [ "./src/startup/version_sticker.sh", "${STARTUPDIR}/" ]

### Fix permissions
RUN \
    gtk-update-icon-cache -f /usr/share/icons/hicolor \
    && chmod a+wx "${STARTUPDIR}"/version_sticker.sh \
    && "${STARTUPDIR}"/set_user_permissions.sh "${STARTUPDIR}" "${HOME}"

FROM stage-vscode as stage-typescript

USER 1001

### Install TypeScript as a non-root default application user
RUN npm install -g \
        typescript \
    && rm -r /home/headless/.npm/_cacache/

FROM stage-typescript as stage-final

ARG ARG_REFRESHED_AT
ARG ARG_VERSION_STICKER
ARG ARG_VCS_REF

LABEL \
    org.label-schema.vcs-ref="${ARG_VCS_REF}" \
    version-sticker="${ARG_VERSION_STICKER}"

ENV \
    REFRESHED_AT=${ARG_REFRESHED_AT} \
    VERSION_STICKER=${ARG_VERSION_STICKER}
