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

FROM accetto/xubuntu-vnc-typescript:${BASETAG} as stage-angular

USER 0

ENV NG_CLI_ANALYTICS=false

RUN npm install -g @angular/cli

COPY [ "./src/startup/version_sticker.sh", "${STARTUPDIR}/" ]

### Fix permissions
### Don't break building, setting permissions takes quite a while.
RUN \
    chmod a+wx "${STARTUPDIR}"/version_sticker.sh \
    && "${STARTUPDIR}"/set_user_permissions.sh "${STARTUPDIR}" "${HOME}"

FROM stage-angular as stage-final

ARG ARG_REFRESHED_AT
ARG ARG_VERSION_STICKER
ARG ARG_VCS_REF

LABEL \
    org.label-schema.vcs-ref="${ARG_VCS_REF}" \
    version-sticker="${ARG_VERSION_STICKER}"

ENV \
    REFRESHED_AT=${ARG_REFRESHED_AT} \
    VERSION_STICKER=${ARG_VERSION_STICKER}

USER 1001
