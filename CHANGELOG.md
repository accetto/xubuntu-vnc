# CHANGELOG

## Project `accetto/xubuntu-vnc`

[Docker Hub][this-docker] - [Git Hub][this-github] - [Wiki][this-wiki] - [Hierarchy][this-wiki-image-hierarchy]

***

### Release 19.12.4

- **xubuntu-vnc**
  - **TigerVNC** version **1.10.1**
    - version still incorrectly reported as **1.10.0** (see [issue #925](https://github.com/TigerVNC/tigervnc/issues/925))
  - **vnc_startup.sh** and some other session related stuff updated
  - **Dockerfile** updated
- all other images inherited the above changes

### Release 19.12.3

- Updated versions:
  - TypeScript **3.7.4**

### Release 19.12.2

- All images:
  - **Ubuntu** base image has been updated
- Updated versions:
  - Chromium Browser **79.0.3945.79**
  - Node.js **12.14.0**
    - `current` tag with **13.5.0**
  - npm **6.13.4**
  - VSCode **1.41.1**
  - Heroku **7.35.1**
  - Angular **8.3.21**

### Release 19.12.1

- Updated versions:
  - VSCode **1.41.0**
- Utilities:
  - **util-inspect.sh** added

### Release 19.12

- Updated versions:
  - Firefox **71.0**
  - Node.js `current` **13.3.0**
  - TypeScript **3.7.3**

### Release 19.11.6

- All images:
  - **TigerVNC** server and client updated to version **1.10.0**
- Updated versions:
  - VSCode **1.40.2**
  - Angular **8.3.20**
  
### Release 19.11.5

- **xubuntu-vnc-inkscape**
  - GitHub repository folder and Docker image have been restored and they'll be maintained as previously
- **xubuntu-vnc-gimp**
  - new GitHub repository folder and Docker image have been introduced
  - **GIMP** version **2.8.22** (from Ubuntu distribution)
- **xubuntu-vnc-drawio**
  - new GitHub repository folder and Docker image have been introduced
  - **drawio-desktop** version **12.2.2** (the current version)

### Release 19.11.4

- **xubuntu-vnc-inkscape**
  - bitmap image editor **GIMP** added (version **2.8.22** from Ubuntu distribution)
  - Docker image renamed to **xubuntu-vnc-inkscape-gimp**
    - previous Docker image **xubuntu-vnc-inkscape** deprecated (no future builds)
- **xubuntu-vnc-node**
  - `current` image updated
    - Node.js **13.2.0**
    - npm **6.13.1**

### Release 19.11.3

- Updated versions:
  - Chromium Browser **78.0.3904.108**
  - Node.js **12.13.1**
  - npm **6.12.1**

### Release 19.11.2

- All images:
  - simplified output of `vnc_startup.sh` script
  - bottom panel's auto-hide behavior changed from `Intelligently` to `Always`
- Updated versions
  - Chromium Browser **78.0.3904.97**
  - VSCode **1.40.1**
  - Angular **8.3.19**

### Release 19.11.1

- Updated versions:
  - Heroku **7.35.0**

### Release 19.11

- All images:
  - **ubuntu** base image updated
- Updated versions
  - Chromium Browser **78.0.3904.70**
  - Firefox **70.0.1**
  - VSCode **1.40.0**
  - TypeScrip **3.7.2**
  - Heroku **7.34.2**
  - Angular **8.3.18**

### Release 19.10.5

- **xubuntu-vnc-node**
  - switched back to **LTS** version of **Node.js** (it has just been updated)
    - **Dockerfile.node.current** added
    - **Dockerfile.node.lts** removed
  - build hooks updated
- **xubuntu-vnc-typescript**, **xubuntu-vnc-angular**, **xubuntu-vnc-heroku**
  - updated **Node.js** version (inherited from the base)
- Updated versions
  - Firefox version **70.0**
  - Node.js
    - `lts` version **12.13.0** (includes npm **6.12.0**)
    - `current` version **13.0.1** (includes npm **6.12.0**)
  - Angular version **8.3.14**

### Release 19.10.4

- **xubuntu-vnc**
  - **ubuntu** base image updated (inherited by all images)
  - **curl** and **git** added (inherited by all images)
  - **jq** (JSON processor) added in its latest version **1.6** (inherited by all images)
  - **version_of.sh** script handles also **jq** (inherited by all images)
  - **version_sticker.sh** reports added apps (similar update by all images)
  - `test` build hook updated (similar update by all images)
  - README file updated (similar update by all images)
- **xubuntu-vnc-chromium**, **xubuntu-vnc-inkscape**
  - inherited new features from the base (see above)
- **xubuntu-vnc-firefox**
  - inherited new features from the base (see above)
  - `env` build hook updated
- **xubuntu-vnc-node**
  - inherited new features from the base (see above), esp. note
    - **curl** and **git** are inherited from the base now
  - **Node.js** updated from **LTS** (10.16.3, npm 6.9.0) to **current** (12.12.0, npm 6.11.3)
    - **LTS** version still maintained
      - **Dockerfile.node.lts** added
      - tag **lts** introduced (not with **chromium** or **firefox**)
      - build hook **env** updated to support **lts** tag
- **xubuntu-vnc-typescript**, **xubuntu-vnc-angular**
  - inherited new features from the base (see above)
- **xubuntu-vnc-heroku**
  - inherited new features from the base (see above)
  - Dockefile renamed to `Dockerfile.heroku.js`
  - Docker Hub repository renamed to **xubuntu-vnc-heroku-js-postgresql**
    - former repository **xubuntu-vnc-js-heroku-postgresql** is deprecated

### Release 19.10.3

- Updated versions:
  - Angular **8.3.12**

### Release 19.10.2

- All images:
  - README updated
    - **version sticker** described
    - new badges added
  - build hooks updated
    - command line arguments passed to `build` hook
- Updated versions:
  - VSCode **1.39.2**
  - Angular **8.3.10**

### Release 19.10.1

- All images:
  - badges re-designed
    - previous badges removed and new status badges from `badge.net` and `shields.io` introduced
    - `commit` badge from `microbadger.com` introduced (per tag)
    - `version sticker` badge introduced (as static badge from `badge.net`)
    - remark: it can take several hours until new badges are actually shown (caused by caching)
  - build hooks updated
  - script **util-refresh-readme.sh** introduced
- Updated versions
  - Firefox **69.0.2**
  - VSCode **1.39.1**
  - TypeScript **3.6.4**
  - Heroku **7.33.3**
  - Angular **8.3.9**

### Release 19.10

- README updated
- Updated versions
  - Firefox **69.0.1**
  - Chromium Browser **77.0.3865.90**
  - Angular **8.3.8**
  - Heroku **7.33.1**

### Release 19.09.2

- All images:
  - scripts **version_sticker.sh** and **version_of.sh** updated
- Updated versions
  - VSCode **1.38.1**
  - TypeScript **3.6.3**
  - Angular **8.3.5**
  - Heroku **7.30.0**

### Release 19.09.1

- All images
  - environment variable **VERSION_STICKER** and build argument **ARG_VERSION_STICKER** introduced
  - scripts **version_sticker.sh** and **version_of.sh** introduced
- Updated versions
  - Firefox **69.0**
  - VSCode **1.38.0**
  - Angular **8.3.3**

### Release 19.09

- images with **Angular** introduced (**xubuntu-vnc-angular**)
- all **README** files updated

### Release 19.08.3

- **xubuntu-vnc**
  - build argument **ARG_REFRESHED_AT** introduced
    - environment variable **REFRESHED_AT** set to the actual build date
    - utility **util-update-refreshed-at** removed
- **xubuntu-vnc-firefox**
  - build argument **ARG_REFRESHED_AT** introduced
    - environment variable **REFRESHED_AT** set to the actual build date
- **xubuntu-vnc-chromium**
  - newer base image (**Ubuntu 18.04.3 LTS**) (inherited from the base image)
  - **Chromium Browser** updated to version **76.0.3809.100**
  - build argument **ARG_REFRESHED_AT** introduced
    - environment variable **REFRESHED_AT** set to the actual build date
- **xubuntu-vnc-inkscape**
  - newer base image (**Ubuntu 18.04.3 LTS**) (inherited from the base image)
  - build argument **ARG_REFRESHED_AT** introduced
    - environment variable **REFRESHED_AT** set to the actual build date
  - build argument **BASEIMAGE** introduced and **Dockerfile.inkscape.firefox** removed
  - only `firefox` tag: newer **Firefox** version (**68.0.2**, inherited from the base image)
- **xubuntu-vnc-node**
  - newer base image (**Ubuntu 18.04.3 LTS**) (inherited from the base image)
  - build argument **ARG_REFRESHED_AT** introduced
    - environment variable **REFRESHED_AT** set to the actual build date
  - build argument **BASEIMAGE** introduced and **Dockerfile.node.firefox** and **Dockerfile.node.chromium** removed
  - environment variable **NODE_PORT** and build argument **ARG_NODE_PORT** have been added
    - port **3000** by default
    - port is not exposed by default (disabled in Dockerfile)
  - a simple **test-node-app** added
    - start it as `node app.js` (from `/usr/src/node-test-app`)
    - connect to the container's **NODE_PORT**
    - don't forget to create the container as, for example, `docker run -p 3000 ...`
  - only `firefox` tag: newer **Firefox** version (**68.0.2**, inherited from the base image)
  - only `chromium` tag: newer **Chromium Browser** version (**76.0.3809.100**, inherited from the base image)
- **xubuntu-vnc-typescript**
  - newer base image (**Ubuntu 18.04.3 LTS**) (inherited from the base image)
  - build argument **ARG_REFRESHED_AT** introduced
    - environment variable **REFRESHED_AT** set to the actual build date
  - **TypeScript** installed by the non-root default application user (1001:0)
  - **Dockerfile.typescript.firefox** and **Dockerfile.typescript.chromium** removed
  - only `firefox` tag: newer **Firefox** version (**68.0.2**, inherited from the base image)
  - only `chromium` tag: newer **Chromium Browser** version (**76.0.3809.100**, inherited from the base image)
- **xubuntu-vnc-heroku**
  - newer base image (**Ubuntu 18.04.3 LTS**) (inherited from the base image)
  - build argument **ARG_REFRESHED_AT** introduced
    - environment variable **REFRESHED_AT** set to the actual build date
  - **TypeScript** installed by the non-root default application user (1001:0) (inherited from the base image)
  - **Dockerfile.js.heroku.firefox** and **Dockerfile.js.heroku.chromium** removed
  - only `firefox` tag: newer **Firefox** version (**68.0.2**, inherited from the base image)
  - only `chromium` tag: newer **Chromium Browser** version (**76.0.3809.100**, inherited from the base image)

### Release 19.08.2

- **xubuntu-vnc-firefox**
  - newer base image (**Ubuntu 18.04.3 LTS**) (inherited from the base image)
  - **Firefox** updated to version **68.0.2**
  - [Issue #2](https://github.com/accetto/xubuntu-vnc/issues/2) fixed by updating to the latest Firefox version
  - [Issue #3](https://github.com/accetto/xubuntu-vnc/issues/3) fixed by disabling the Firefox multi-process feature
  - environment variable **MOZ_FORCE_DISABLE_E10S** and build argument **ARG_MOZ_FORCE_DISABLE_E10S** introduced
  - image tag `multiprocess` introduced
    - same as `latest` but the multi-process is **enabled** (note that it will probably crash a lot)
  - **README** has been updated

### Release 19.08.1

- **xubuntu-vnc**
  - newer base image (**Ubuntu 18.04.3 LTS**)
  - [Issue #5](https://github.com/accetto/xubuntu-vnc/issues/5) fixed
  - `lab` tag: environment variable **SUPPORT_USER_GROUP_OVERRIDE** added so it's easier to check how the image was built (it has no other function)
  - build hooks introduced and therefore
    - **Dockerfile_lab** removed
  - **Dockerfile.inkscape.bare** and **Dockerfile.firefox.bare** also removed
  - **README** file updated

### Release 19.08

- **xubuntu-vnc**
  - **sudo** added
    - **default application user** (headless) is added to **sudoers** (allowing for `sudo apt-get install`, for example)
    - default application user's password comes from **$VNC_PW** (**headless** by default)
    - container user changed from **root** (0:0) to the **default application user** (headless, 1001:0)
- **xubuntu-vnc-firefox**
  - **sudo** added (inherited from the base)
  - **Firefox** still kept on version **67.0.4** because **68.*** crashes a lot
- **xubuntu-vnc-chromium**
  - **sudo** added (inherited from the base)
  - **Chromium Browser** updated to version **76.0.3809.87**
- **xubuntu-vnc-inkscape**
  - **sudo** added (inherited from the base)
- **xubuntu-vnc-node**
  - **sudo** added (inherited from the base)
  - **Node.js** updated to version **10.16.2** (includes **npm** version **6.9.0**)
- **xubuntu-vnc-typescript**
  - **sudo** added (inherited from the base)
  - **Visual Studio Code** updated to version **1.37.0**
- **xubuntu-vnc-heroku**
  - **sudo** added (inherited from the base)
  - **Heroku CLI** updated to version **7.27.1**
  - **PostgreSQL** updated to version **10.10**

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

[this-docker]: https://hub.docker.com/u/accetto/

[this-github]: https://github.com/accetto/xubuntu-vnc/
[this-wiki]: https://github.com/accetto/xubuntu-vnc/wiki
[this-wiki-image-hierarchy]: https://github.com/accetto/xubuntu-vnc/wiki/Image-hierarchy

[accetto-ubuntu-vnc-xfce]: https://hub.docker.com/r/accetto/ubuntu-vnc-xfce/
[accetto-ubuntu-vnc-xfce-firefox-plus]: https://hub.docker.com/r/accetto/ubuntu-vnc-xfce-firefox-plus/
