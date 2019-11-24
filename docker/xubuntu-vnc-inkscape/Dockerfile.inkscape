# ./hooks/build dev
# ./hooks/build dfw
# ./hooks/build nux
# ./hooks/build nux --no-cache
# ./hooks/build dev-firefox
# ./hooks/build dfw-firefox
# ./hooks/build nux-firefox

ARG BASEIMAGE=accetto/xubuntu-vnc
ARG BASETAG=latest

FROM ${BASEIMAGE}:${BASETAG} as stage-inkscape

### Switch to root user before install
USER 0

### 'apt-get clean' runs automatically
RUN apt-get update && apt-get install -y \
        inkscape \
    && apt-get -y autoremove \
    && rm -rf /var/lib/apt/lists/*

### Preconfigure Xfce desktop
COPY [ "./src/home/Desktop", "${HOME}/Desktop/" ]
COPY [ "./src/startup/version_sticker.sh", "${STARTUPDIR}/" ]

### Fix permissions
RUN \
    chmod a+wx "${STARTUPDIR}"/version_sticker.sh \
    && "${STARTUPDIR}"/set_user_permissions.sh "${STARTUPDIR}" "${HOME}"

FROM stage-inkscape as stage-final

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
