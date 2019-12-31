# ./hooks/build dev
# ./hooks/build dfw
# ./hooks/build nux
# ./hooks/build nux --no-cache
# ./hooks/build dev-lab
# ./hooks/build dfw-lab
# ./hooks/build nux-lab

ARG BASETAG=latest

FROM ubuntu:${BASETAG} as stage-ubuntu

ARG ARG_VERSION_STICKER
ARG ARG_VCS_REF

SHELL ["/bin/bash", "-c"]

LABEL \
    maintainer="https://github.com/accetto" \
    vendor="accetto" \
    version-sticker="${ARG_VERSION_STICKER}" \
    org.label-schema.vcs-ref="${ARG_VCS_REF}" \
    org.label-schema.vcs-url="https://github.com/accetto/xubuntu-vnc"

### 'apt-get clean' runs automatically
RUN apt-get update && apt-get install -y \
        inetutils-ping \
        lsb-release \
        net-tools \
        sudo \
        unzip \
        vim \
        zip \
        curl \
        git \
        wget \
    && apt-get -y autoremove \
    && rm -rf /var/lib/apt/lists/*

### install current 'jq' explicitly
RUN \
{ \
    JQ_VERSION="1.6" ; \
    JQ_DISTRO="jq-linux64" ; \
    cd /tmp ; \
    wget -q "https://github.com/stedolan/jq/releases/download/jq-${JQ_VERSION}/${JQ_DISTRO}" ; \
    wget -q "https://raw.githubusercontent.com/stedolan/jq/master/sig/v${JQ_VERSION}/sha256sum.txt" ; \
    test=$(grep "${JQ_DISTRO}" sha256sum.txt | sha256sum -c | grep -c "${JQ_DISTRO}: OK") ; \
    if [[ $test -ne 1 ]] ; then \
        echo "FAILURE: ${JQ_DISTRO} failed checksum test" ; \
        exit 1 ; \
    else \
        rm sha256sum.txt ; \
        chown root "${JQ_DISTRO}" ; \
        chmod +x "${JQ_DISTRO}" ; \
        # mv -f "${JQ_DISTRO}" $(which jq) ; \
        mv -f "${JQ_DISTRO}" /usr/bin/jq ; \
    fi ; \
    cd - ; \
}    

### next ENTRYPOINT command supports development and should be overriden or disabled
### it allows running detached containers created from intermediate images, for example:
### docker build --target stage-vnc -t dev/ubuntu-vnc-xfce:stage-vnc .
### docker run -d --name test-stage-vnc dev/ubuntu-vnc-xfce:stage-vnc
### docker exec -it test-stage-vnc bash
# ENTRYPOINT ["tail", "-f", "/dev/null"]

FROM stage-ubuntu as stage-xfce

ENV \
    DEBIAN_FRONTEND=noninteractive \
    LANG='en_US.UTF-8' \
    LANGUAGE='en_US:en' \
    LC_ALL='en_US.UTF-8'

### 'apt-get clean' runs automatically
RUN apt-get update && apt-get install -y \
        locales \
        supervisor \
        xfce4 \
        xfce4-terminal \
        xfce4-screenshooter \
        mousepad \
        ristretto \
    && locale-gen en_US.UTF-8 \
    && apt-get purge -y \
        pm-utils \
        xscreensaver* \
    && apt-get -y autoremove \
    && rm -rf /var/lib/apt/lists/*

FROM stage-xfce as stage-vnc

RUN wget -qO- https://dl.bintray.com/tigervnc/stable/tigervnc-1.10.1.x86_64.tar.gz | tar xz --strip 1 -C /

FROM stage-vnc as stage-tini

ADD https://github.com/krallin/tini/releases/download/v0.18.0/tini /tini
RUN chmod +x /tini

FROM stage-tini as stage-final

LABEL \
    any.accetto.description="Headless Ubuntu/VNC container with Xfce desktop" \
    any.accetto.display-name="Headless Ubuntu/VNC container with Xfce desktop" \
    any.accetto.expose-services="5901:xvnc" \
    any.accetto.tags="ubuntu, xfce, vnc"

### Arguments can be provided during build
ARG ARG_HOME
ARG ARG_VNC_BLACKLIST_THRESHOLD
ARG ARG_VNC_BLACKLIST_TIMEOUT
ARG ARG_VNC_PW
ARG ARG_VNC_RESOLUTION
ARG ARG_SUPPORT_USER_GROUP_OVERRIDE

ENV \
    DISPLAY=:1 \
    HOME=${ARG_HOME:-/home/headless} \
    STARTUPDIR=/dockerstartup \
    VNC_BLACKLIST_THRESHOLD=${ARG_VNC_BLACKLIST_THRESHOLD:-20} \
    VNC_BLACKLIST_TIMEOUT=${ARG_VNC_BLACKLIST_TIMEOUT:-0} \
    VNC_COL_DEPTH=24 \
    VNC_PORT="5901" \
    VNC_PW=${ARG_VNC_PW:-headless} \
    VNC_RESOLUTION=${ARG_VNC_RESOLUTION:-1360x768} \
    VNC_VIEW_ONLY=false \
    SUPPORT_USER_GROUP_OVERRIDE=${ARG_SUPPORT_USER_GROUP_OVERRIDE}

### Creates home folder
WORKDIR ${HOME}

COPY [ "./src/startup", "${STARTUPDIR}/" ]

### Preconfigure Xfce
COPY [ "./src/home/Desktop", "${HOME}/Desktop/" ]
COPY [ "./src/home/config/xfce4", "${HOME}/.config/xfce4/" ]
COPY [ "./src/home/config/autostart", "${HOME}/.config/autostart/" ]

### Create the default application user (non-root, but member of the group zero)
### and make '/etc/passwd' and '/etc/group' writable for the group.
### Providing the build argument ARG_SUPPORT_USER_GROUP_OVERRIDE (set to anything) makes both files
### writable for all users, adding support for user group override (like 'run --user x:y').
RUN \
    chmod 664 /etc/passwd /etc/group \
    && echo "headless:x:1001:0:Default:${HOME}:/bin/bash" >> /etc/passwd \
    && adduser headless sudo \
    && echo "headless:$VNC_PW" | chpasswd \
    && chmod +x \
        "${STARTUPDIR}/set_user_permissions.sh" \
        "${STARTUPDIR}/generate_container_user.sh" \
        "${STARTUPDIR}/vnc_startup.sh" \
        "${STARTUPDIR}/version_of.sh" \
        "${STARTUPDIR}/version_sticker.sh" \
    && ${ARG_SUPPORT_USER_GROUP_OVERRIDE/*/chmod a+w /etc/passwd /etc/group} \
    && gtk-update-icon-cache -f /usr/share/icons/hicolor

### Fix permissions
RUN "${STARTUPDIR}"/set_user_permissions.sh "${STARTUPDIR}" "${HOME}"

EXPOSE ${VNC_PORT}

### Switch to default application user (non-root)
USER 1001

ARG ARG_REFRESHED_AT
ARG ARG_VERSION_STICKER

ENV \
    REFRESHED_AT=${ARG_REFRESHED_AT} \
    VERSION_STICKER=${ARG_VERSION_STICKER}

ENTRYPOINT [ "/tini", "--", "/dockerstartup/vnc_startup.sh" ]
### tini argument '-w' means 'print a warning when processes are getting reaped'
# ENTRYPOINT [ "/tini", "-w", "--", "/dockerstartup/vnc_startup.sh" ]
### verbose argument '-v' can be repeated up to three times
### level 3 (TRACE) outputs 'No child to reap' every second
### level 2 (DEBUG) outputs also SIGCHLD signals
### level 1 (INFO) doesn't output SIGCHLD signals
# ENTRYPOINT ["/tini", "-w", "-v", "--", "/dockerstartup/vnc_startup.sh"]

### command can be provided also by 'docker run'
# CMD [ "--debug" ]
CMD [ "--wait" ]
