# ./hooks/build dev
# ./hooks/build dfw
# ./hooks/build nux
# ./hooks/build nux --no-cache
# ./hooks/build dev-firefox
# ./hooks/build dfw-firefox
# ./hooks/build nux-firefox

ARG BASEIMAGE=accetto/xubuntu-vnc
ARG BASETAG=latest

FROM ${BASEIMAGE}:${BASETAG} as stage-drawio

### Switch to root user before install
USER 0

### install current 'drawio-desktop' explicitly
### https://github.com/jgraph/drawio-desktop/releases/download/v12.2.2/draw.io-amd64-12.2.2.deb
ENV \
    DRAWIO_VERSION="12.2.2"
RUN apt-get update && apt-get install -y \
        xdg-utils \
        libappindicator3-1 \
    && wget -q "https://github.com/jgraph/drawio-desktop/releases/download/v${DRAWIO_VERSION}/draw.io-amd64-${DRAWIO_VERSION}.deb" \
        && dpkg -i draw.io-amd64-${DRAWIO_VERSION}.deb \
        && apt-get -y -f install \
        && rm draw.io-amd64-${DRAWIO_VERSION}.deb \
    && apt-get -y autoremove \
    && rm -rf /var/lib/apt/lists/*

### Preconfigure Xfce 
COPY [ "./src/home/Desktop", "${HOME}/Desktop/" ]
COPY [ "./src/startup/version_sticker.sh", "${STARTUPDIR}/" ]
COPY [ "./src/home/Desktop/drawio.desktop", "/usr/share/applications/drawio.desktop" ]

### Fix permissions
RUN \
    chmod a+wx "${STARTUPDIR}"/version_sticker.sh \
    && "${STARTUPDIR}"/set_user_permissions.sh "${STARTUPDIR}" "${HOME}"

FROM stage-drawio as stage-final

ARG ARG_REFRESHED_AT
ARG ARG_VERSION_STICKER
ARG ARG_VCS_REF

LABEL \
    org.label-schema.vcs-ref="${ARG_VCS_REF}" \
    version-sticker="${ARG_VERSION_STICKER}"

ENV \
    REFRESHED_AT=${ARG_REFRESHED_AT} \
    VERSION_STICKER=${ARG_VERSION_STICKER}

### Switch to default application user (non-root)
USER 1001
