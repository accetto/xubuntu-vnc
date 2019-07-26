# CHANGELOG

## Project `accetto/xubuntu-vnc`

[Git Hub][this-github] - [Wiki][this-wiki]

***

### Release 19.07.4

- **xubuntu-vnc**
  - **zip** and **unzip** utilities added
  - terminal emulator set explicitly to **xfce4-terminal**
- **xubuntu-vnc-firefox**
  - **zip** and **unzip** utilities added (inherited from the base)
  - [Issue #1](https://github.com/accetto/xubuntu-vnc/issues/1): fixed by setting the default web browser explicitly
  - [Issue #3](https://github.com/accetto/xubuntu-vnc/issues/3): mitigated by keeping the previous version **67.0.4** which does not crash
  - [Issue #4](https://github.com/accetto/xubuntu-vnc/issues/4): Wiki page [Firefox version compatibility
](https://github.com/accetto/xubuntu-vnc/wiki/Firefox-version-compatibility) explains the fix
- **xubuntu-vnc-chromium**
  - **zip** and **unzip** utilities added (inherited from the base)
  - [Issue #1](https://github.com/accetto/xubuntu-vnc/issues/1): fixed by setting the default web browser explicitly
- **xubuntu-vnc-node**, **xubuntu-vnc-typescript**, **xubuntu-vnc-javascript-heroku**, **xubuntu-vnc-inkscape**
  - **zip** and **unzip** utilities added (inherited from the base)
  - [Issue #1](https://github.com/accetto/xubuntu-vnc/issues/1) (tags with web browsers only): fixed by setting the default web browser explicitly (inherited from the base)
  - [Issue #3](https://github.com/accetto/xubuntu-vnc/issues/3) (**firefox** tags only): mitigated by keeping the previous version **67.0.4** which does not crash (inherited from the base)
  - [Issue #4](https://github.com/accetto/xubuntu-vnc/issues/4) (**firefox** tags only): Wiki page [Firefox version compatibility
](https://github.com/accetto/xubuntu-vnc/wiki/Firefox-version-compatibility) explains the fix (inherited from the base)

### Release 19.07.3

- **xubuntu-vnc-node**
  - Dockerfile redesigned
    - **git** added
    - explicit **Node.js** version **10.6.0**
    - **npm** version **6.9.0** (comes with node)
- **xubuntu-vnc-firefox**
  - still kept on version **67.0.4** because also **68.0.1** crashes a lot (Gah. Your tab just crashed.)
- **xubuntu-vnc-javascript**
  - folder renamed to **xubuntu-vnc-typescript**
  - Dockerfile redesigned
    - **curl** and **git** removed (they are inherited from the base now)
    - newer **Node.js** and **npm** (inherited from the base)
- **xubuntu-vnc-javascript-heroku**
  - based on the renamed **xubuntu-vnc-typescript** now
  - newer **Node.js** and **npm** (inherited from the base)

### Release 19.07.2

- **xubuntu-vnc-firefox**
  - alternative explicit Firefox version installation added
  - Firefox version kept on **67.0.4** because **68.0** crashes a lot
- **xubuntu-vnc-node**
  - only VNC port **5901** is exposed by default
  - build argument **ARG_EXPOSED_PORT** removed
  - README file updated
- **xubuntu-vnc-javascript**
  - only VNC port **5901** is exposed by default (inherited from the base)
  - resources for **Heroku** and **PostgreSQL** moved out
  - README file updated
- **xubuntu-vnc-heroku**
  - folder added as new

### Release 19.07.1

- **xubuntu-vnc-node**
  - build argument **ARG_EXPOSED_PORT** allows changing the default exposed port (instead of **8080**)
- **xubuntu-vnc-firefox**
  - sample `Dockerfile.firefox.myown` shows how to build images with own Firefox preferences in few seconds
  - Firefox version kept on **67.0.4** because **68.0** crashes a lot
- **xubuntu-vnc-javascript**
  - **Git** added
  - sample Dockerfiles added
    - `Dockerfile.js.heroku` adds **heroku-cli** and **PostgreSQL**

### Release 19.07

- **xubuntu-vnc** refreshed
  - Ubuntu version 18.04.2 LTS
- **xubuntu-vnc-firefox** refreshed
  - Firefox version 67.0.4
- **xubuntu-vnc-chromium** refreshed
  - Chromium Browser version 75.0.3770.90
- **xubuntu-vnc-inkscape** refreshed
  - Inkscape version 0.92.3
- **xubuntu-vnc-node** modified and refreshed
  - folder permissions fixed
  - Node.js version 8.10.0
  - npm version 3.5.2
- **xubuntu-vnc-javascript** modified and refreshed
  - LoopBack removed from default Dockerfiles
  - folder permissions fixed
  - Visual Studio Code
    - **bash** as pre-configured shell type
    - version 1.36.1
  - TypeScript version 3.5.3

### Release 19.06.2

- **xubuntu-vnc-node**
  - README file updated - screenshot added
- **xubuntu-vnc-javascript**
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
