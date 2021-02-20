# ./hooks/build dev
# ./hooks/test dev

### Example: Build and test 'dev' tag locally like
### ./hooks/build dev
### ./hooks/test dev
### or with additional arguments
### ./hooks/build dev --no-cache
### ./hooks/test dev
### or using the utility
### ./utils/util-hdx.sh Dockerfile 1
### ./utils/util-hdx.sh Dockerfile 2
### The last output line should be '+ exit 0'
### If '+ exit 1' then adjust the version sticker
### variables in script './hooks/env'

ARG BASETAG=latest

FROM accetto/xubuntu-vnc-typescript:${BASETAG} as stage-heroku

USER 0

RUN curl https://cli-assets.heroku.com/install-ubuntu.sh | bash \
    && chmod -R g+w "${HOME}"/.cache

FROM stage-heroku as stage-postgresql

ARG ARG_PROJECTS_DIR

ENV PROJECTS_DIR=${ARG_PROJECTS_DIR:-/srv/projects}

### 'apt-get clean' runs automatically
RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y \
        postgresql \
    && apt-get -y autoremove \
    && rm -rf /var/lib/apt/lists/*

### Alternatively install an explicit PostgreSQL version (e.g. version 10)
### 'apt-get clean' runs automatically
# RUN \
#     wget -q https://www.postgresql.org/media/keys/ACCC4CF8.asc -O- | apt-key add - \
#         && echo "deb http://apt.postgresql.org/pub/repos/apt/ bionic-pgdg main" | tee /etc/apt/sources.list.d/postgresql.list \
#         && apt-get update && apt-get install -y \
#             postgresql-10 \
#     && apt-get -y autoremove \
#     && rm -rf /var/lib/apt/lists/

COPY [ "./src/startup/version_sticker.sh", "${STARTUPDIR}/" ]

WORKDIR "${PROJECTS_DIR}"

### Fix permissions
RUN \
    chmod -R g+w "${PROJECTS_DIR}" \
    && chmod a+wx "${STARTUPDIR}"/version_sticker.sh \
    && "${STARTUPDIR}"/set_user_permissions.sh "${STARTUPDIR}" "${HOME}"

FROM stage-postgresql as stage-final

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
