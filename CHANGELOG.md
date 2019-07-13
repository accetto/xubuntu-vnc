# CHANGELOG

## Project `accetto/xubuntu-vnc`

[Git Hub][this-github] - [Wiki][this-wiki]

***

### Release 19.07.1

- **accetto/xubuntu-vnc-node**
  - build argument **ARG_EXPOSED_PORT** allows changing the default exposed port (instead of **8080**)
- **accetto/xubuntu-vnc-firefox**
  - sample `Dockerfile.firefox.myown` shows how to build images with own Firefox preferences in few seconds
  - Firefox version kept on **67.0.4** because **68.0** crashes a lot
- **accetto/xubuntu-vnc-javascript**
  - **Git** added
  - sample Dockerfiles added
    - `Dockerfile.js.heroku` adds **heroku-cli** and **PostgreSQL**

### Release 19.07

- **accetto/xubuntu-vnc** refreshed
  - Ubuntu version 18.04.2 LTS
- **accetto/xubuntu-vnc-firefox** refreshed
  - Firefox version 67.0.4
- **accetto/xubuntu-vnc-chromium** refreshed
  - Chromium Browser version 75.0.3770.90
- **accetto/xubuntu-vnc-inkscape** refreshed
  - Inkscape version 0.92.3
- **accetto/xubuntu-vnc-node** modified and refreshed
  - folder permissions fixed
  - Node.js version 8.10.0
  - npm version 3.5.2
- **accetto/xubuntu-vnc-javascript** modified and refreshed
  - LoopBack removed from default Dockerfiles
  - folder permissions fixed
  - Visual Studio Code
    - **bash** as pre-configured shell type
    - version 1.36.1
  - TypeScript version 3.5.3

### Release 19.06.2

- **accetto/xubuntu-vnc-node**
  - README file updated - screenshot added
- **accetto/xubuntu-vnc-javascript**
  - README file updated - screenshot added
  - desktop launcher **Visual Studio Code** added

### Release 19.06.1-javascript

#### accetto/xubuntu-vnc-javascript

Initial version is new.

### Release 19.06.1-node

#### accetto/xubuntu-vnc-node

Initial version is new.

### Release 19.06.1

`apt-get autoremove` added to all Dockerfiles

### Release 19.06-chromium

#### accetto/xubuntu-vnc-chromium

Initial version is new.

### Release 19.06-inkscape

#### accetto/xubuntu-vnc-inkscape

Initial version is new.

### Release 19.06-firefox

#### accetto/xubuntu-vnc-firefox

Initial version is derived from the version **19.06.02** of [accetto/ubuntu-vnc-xfce-firefox-plus][accetto-ubuntu-vnc-xfce-firefox-plus].

The following **plus** features are implemented:

- Backup folder **firefox.plus** containing
  - file **user.js** for personal Firefox preferences
  - helper utility script **copy_firefox_user_preferences.sh**
- Desktop launcher **Copy FF Preferences** for the utility
- Desktop launcher **FF Profile Manager**

### Release 19.06-base

#### accetto/xubuntu-vnc

Initial version is derived from the version **19.06** of [accetto/ubuntu-vnc-xfce][accetto-ubuntu-vnc-xfce] and redesigned:

- **tini** as entry-point initial process (PID 1)
- **noVNC** not included any more
  - only one VNC port exposed (5901)
- Module **nss_wrapper** not used any more
  - scripts **generate_container_user** and **vnc_startup.sh** adjusted
- Script **set_user_permissions.sh** updated
- Build argument **ARG_SUPPORT_USER_GROUP_OVERRIDE** supports overriding also user groups, like 'y' in the following
  - `docker run --user x:y`
  - only numerical 'x' and 'y' are supported
- File manager (Thunar) pre-configured
  - *Owner*, *Permissions* and *Group* columns shown by default
  - *Type* column suppressed
- Terminal pre-configured
  - automatic background color change for each tab

***

[this-github]: https://github.com/accetto/xubuntu-vnc/
[this-wiki]: https://github.com/accetto/xubuntu-vnc/wiki

[accetto-ubuntu-vnc-xfce]: https://hub.docker.com/r/accetto/ubuntu-vnc-xfce/
[accetto-ubuntu-vnc-xfce-firefox-plus]: https://hub.docker.com/r/accetto/ubuntu-vnc-xfce-firefox-plus/
