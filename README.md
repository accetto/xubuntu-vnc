# Headless Ubuntu/Xfce containers with VNC

## Project `accetto/xubuntu-vnc`

[Git Hub][this-github] - [Changelog][this-changelog] - [Wiki][this-wiki]

***

This project repository contains resources for building various Docker images based on [Ubuntu][docker-ubuntu] with [Xfce][xfce] desktop environment and [VNC][tigervnc] server for headless use.

The resources for the individual images and their variations are stored in the subfolders of the [Git Hub][this-github] repository and the image features are described in the individual README files. Additional descriptions can be found in the common project [Wiki][this-wiki].

### Git Hub subfolders / Docker image sets

#### [xubuntu-vnc][this-github-xubuntu-vnc]

Contains resources for building [accetto/xubuntu-vnc][this-docker-xubuntu-vnc] base images.

The images are streamlined and simplified versions of my other images [accetto/ubuntu-vnc-xfce][accetto-docker-ubuntu-vnc-xfce].

Several variations are available, including the one supporting overriding both the container user and the user group.

Examples of Dockerfiles for building stand-alone application images from scratch are also included.

#### [xubuntu-vnc-firefox][this-github-xubuntu-vnc-firefox]
  
Contains resources for building [accetto/xubuntu-vnc-firefox][this-docker-xubuntu-vnc-firefox] images with the current [Firefox Quantum][firefox] web browser.

Several variations are available, including the one supporting easy pre-configuration and copying of personal Firefox user preferences.

The images are streamlined and simplified versions of my other images [accetto/ubuntu-vnc-xfce-firefox-plus][accetto-docker-ubuntu-vnc-xfce-firefox-plus] and [accetto/ubuntu-vnc-xfce-firefox-default][accetto-docker-ubuntu-vnc-xfce-firefox-default].

#### [xubuntu-vnc-inkscape][this-github-xubuntu-vnc-inkscape]
  
Contains resources for building [accetto/xubuntu-vnc-inkscape][this-docker-xubuntu-vnc-inkscape] images with the free open-source vector graphics editor [Inkscape][inkscape].

Several variations are available, including the one with the current [Firefox Quantum][firefox] web browser.

#### [xubuntu-vnc-chromium][this-github-xubuntu-vnc-chromium]
  
Contains resources for building [accetto/xubuntu-vnc-chromium][this-docker-xubuntu-vnc-chromium] images with the open-source [Chromium][chromium] web browser.

#### [xubuntu-vnc-node][this-github-xubuntu-vnc-node]

Contains resources for building [accetto/xubuntu-vnc-node][this-docker-xubuntu-vnc-node] images withe the [Node.js][nodejs] JavaScript-based development platform.

#### [utils][this-github-utils]
  
Contains various utilities that make building the images more convenient.

- `util-update-refreshed-at.sh`  
  
  Updates the **REFRESHED_AT** environment variable to the current date in all Dockerfiles it finds underneath the given folder.

- `util-hdx.sh`  
  
  Displays the file head and executes the chosen line, removing the first occurrence of '#' and trimming the line from left first. Providing the line number argument skips the interaction and executes the given line directly.
  
  The comment lines at the top of included Dockerfiles are intended for this utility.

Each utility displays the help if started with the `-h` or `--help` argument.

The utilities have been developed using my other utilities `utility-argbash-init.sh` and `utility-argbash.sh`, contained in the [accetto/argbash-docker][accetto-github-argbash-docker-utils] Git Hub repository, from which the [accetto/argbash-docker][accetto-docker-argbash-docker] Docker image is built.

## Issues

If you have found a problem or you just have a question, please check the [Issues][this-issues] and the [Wiki][this-wiki] first. Please do not overlook the closed issues.

If you do not find a solution, you can file a new issue. The better you describe the problem, the bigger the chance it'll be solved soon.

## Credits

Credit goes to all the countless people and companies, who contribute to open source community and make so many dreamy things real.

***

[this-github]: https://github.com/accetto/xubuntu-vnc/
[this-changelog]: https://github.com/accetto/xubuntu-vnc/blob/master/CHANGELOG.md
[this-wiki]: https://github.com/accetto/xubuntu-vnc/wiki

[this-issues]: https://github.com/accetto/xubuntu-vnc/issues

[this-github-utils]: https://github.com/accetto/xubuntu-vnc/tree/master/utils/

[this-github-xubuntu-vnc]: https://github.com/accetto/xubuntu-vnc/tree/master/docker/xubuntu-vnc/
[this-docker-xubuntu-vnc]: https://hub.docker.com/r/accetto/xubuntu-vnc/

[this-github-xubuntu-vnc-firefox]: https://github.com/accetto/xubuntu-vnc/tree/master/docker/xubuntu-vnc-firefox/
[this-docker-xubuntu-vnc-firefox]: https://hub.docker.com/r/accetto/xubuntu-vnc-firefox/

[this-github-xubuntu-vnc-inkscape]: https://github.com/accetto/xubuntu-vnc/tree/master/docker/xubuntu-vnc-inkscape/
[this-docker-xubuntu-vnc-inkscape]: https://hub.docker.com/r/accetto/xubuntu-vnc-inkscape/

[this-github-xubuntu-vnc-chromium]: https://github.com/accetto/xubuntu-vnc/tree/master/docker/xubuntu-vnc-chromium/
[this-docker-xubuntu-vnc-chromium]: https://hub.docker.com/r/accetto/xubuntu-vnc-chromium/

[this-github-xubuntu-vnc-node]: https://github.com/accetto/xubuntu-vnc/tree/master/docker/xubuntu-vnc-node/
[this-docker-xubuntu-vnc-node]: https://hub.docker.com/r/accetto/xubuntu-vnc-node/

[accetto-docker-ubuntu-vnc-xfce]: https://hub.docker.com/r/accetto/ubuntu-vnc-xfce
[accetto-docker-ubuntu-vnc-xfce-firefox-default]: https://hub.docker.com/r/accetto/ubuntu-vnc-xfce-firefox-default
[accetto-docker-ubuntu-vnc-xfce-firefox-plus]: https://hub.docker.com/r/accetto/ubuntu-vnc-xfce-firefox-plus

[accetto-docker-argbash-docker]: https://hub.docker.com/r/accetto/argbash-docker
[accetto-github-argbash-docker-utils]: https://github.com/accetto/argbash-docker/tree/master/utils

[docker-ubuntu]: https://hub.docker.com/_/ubuntu/

[chromium]: https://www.chromium.org/Home
[inkscape]: https://inkscape.org/
[firefox]: https://www.mozilla.org
[nodejs]: https://nodejs.org/en/
[tigervnc]: http://tigervnc.org
[xfce]: http://www.xfce.org
