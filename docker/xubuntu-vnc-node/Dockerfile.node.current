# ./hooks/build dev-current
# ./hooks/build dfw-current
# ./hooks/build nux-current
# ./hooks/build nux-current --no-cache

ARG BASEIMAGE=accetto/xubuntu-vnc
ARG BASETAG=latest

FROM ${BASEIMAGE}:${BASETAG} as stage-node

USER 0

### This would currently install 'node v8.10.0' with 'npm v3.5.2'
### 'apt-get clean' runs automatically
# RUN \
#     chmod g+w /usr/local/lib \
#     && apt-get update && apt-get install -y \
#         nodejs \
#         npm \
#     && apt-get -y autoremove \
#     && rm -rf /var/lib/apt/lists/*

### Alternatively install the latest 'current' version explicitly
ENV \
    NODE_VERSION=v13.5.0 \
    NODE_DISTRO=linux-x64 \
    NODE_PATH=/usr/local/lib/nodejs \
    NPM_CONFIG_PREFIX=${HOME}/.npm-global
ENV \
    PATH=${NPM_CONFIG_PREFIX}/bin:/usr/local/lib/nodejs/node-${NODE_VERSION}-${NODE_DISTRO}/bin:${PATH}
RUN \
    mkdir -p \
        ${NPM_CONFIG_PREFIX} \
        ${NODE_PATH} \
        ${HOME}/.npm \
    && chmod g+w \
        ${NPM_CONFIG_PREFIX} \
        /usr/local/lib \
    && wget -qO- https://nodejs.org/dist/${NODE_VERSION}/node-${NODE_VERSION}-${NODE_DISTRO}.tar.xz \
        | tar -xJv -C /usr/local/lib/nodejs \
    && ln -s /usr/local/lib/nodejs/node-${NODE_VERSION}-${NODE_DISTRO}/bin/node /usr/bin/node \
    && ln -s /usr/local/lib/nodejs/node-${NODE_VERSION}-${NODE_DISTRO}O/bin/npm /usr/bin/npm \
    && ln -s /usr/local/lib/nodejs/node-${NODE_VERSION}-${NODE_DISTRO}/bin/npx /usr/bin/npx \
    && npm config set prefix ${NPM_CONFIG_PREFIX}

COPY [ "./src/startup/version_sticker.sh", "${STARTUPDIR}/" ]

### Fix permissions
RUN \
    chmod a+wx "${STARTUPDIR}"/version_sticker.sh \
    && "${STARTUPDIR}"/set_user_permissions.sh "${STARTUPDIR}" "${HOME}"

FROM stage-node as stage-final

ARG ARG_REFRESHED_AT
ARG ARG_NODE_PORT
ARG ARG_VERSION_STICKER
ARG ARG_VCS_REF

ENV NODE_PORT=${ARG_NODE_PORT:-3000}

WORKDIR /usr/src

### add a simple app for testing node
### start it by 'node app.js' and connect to the container's port ${NODE_PORT}
### dont'f forget to create the container as for example 'docker run -p 3000 ...'
COPY [ "./src/node-test-app", "./node-test-app/" ]

RUN chmod -R g+w /usr/src

### optionally expose the node port
# EXPOSE ${NODE_PORT}

LABEL \
    org.label-schema.vcs-ref="${ARG_VCS_REF}" \
    version-sticker="${ARG_VERSION_STICKER}"

ENV \
    REFRESHED_AT=${ARG_REFRESHED_AT} \
    VERSION_STICKER=${ARG_VERSION_STICKER}

USER 1001
