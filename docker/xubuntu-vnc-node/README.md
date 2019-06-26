# Headless Ubuntu/Xfce container with VNC and Node.js

## accetto/xubuntu-vnc-node

[Docker Hub][this-docker] - [Git Hub][this-github] - [Changelog][this-changelog] - [Wiki][this-wiki]

***

This repository contains resources for building Docker images based on [Ubuntu][docker-ubuntu] with [Xfce][xfce] desktop environment, [VNC][tigervnc] server for headless use and [Node.js][nodejs] JavaScript-based development platform.

The images are based on the base image [accetto/xubuntu-vnc][accetto-docker-xubuntu-vnc] and inherit all the components and features. Therefore not the whole description will be repeated here.

This image adds the following components:

- [Node.js][nodejs] JavaScript-based development platform
- [npm][npm] package manager for Node.js
- [curl][curl] utility

The history of notable changes is documented in the [CHANGELOG][this-changelog].

![container-screenshot][this-screenshot-container]

### Image tags

The following image tags are regularly maintained and rebuilt:

- `latest` is based on `accetto/xubuntu-vnc:latest`  

    [![version badge](https://images.microbadger.com/badges/version/accetto/xubuntu-vnc-node:latest.svg)](https://microbadger.com/images/accetto/xubuntu-vnc-node:latest "Get your own version badge on microbadger.com") [![size badge](https://images.microbadger.com/badges/image/accetto/xubuntu-vnc-node:latest.svg)](https://microbadger.com/images/accetto/xubuntu-vnc-node:latest "Get your own image badge on microbadger.com")

- `firefox` is based on `accetto/xubuntu-vnc-firefox:latest` and includes also [Firefox][firefox] web browser  

    [![version badge](https://images.microbadger.com/badges/version/accetto/xubuntu-vnc-node:firefox.svg)](https://microbadger.com/images/accetto/xubuntu-vnc-node:firefox "Get your own version badge on microbadger.com") [![size badge](https://images.microbadger.com/badges/image/accetto/xubuntu-vnc-node:firefox.svg)](https://microbadger.com/images/accetto/xubuntu-vnc-node:firefox "Get your own image badge on microbadger.com")

- `chromium` is based on `accetto/xubuntu-vnc-chromium:latest` and includes also [Chromium][chromium] web browser  

    [![version badge](https://images.microbadger.com/badges/version/accetto/xubuntu-vnc-node:chromium.svg)](https://microbadger.com/images/accetto/xubuntu-vnc-node:chromium "Get your own version badge on microbadger.com") [![size badge](https://images.microbadger.com/badges/image/accetto/xubuntu-vnc-node:chromium.svg)](https://microbadger.com/images/accetto/xubuntu-vnc-node:chromium "Get your own image badge on microbadger.com")

### Dockerfiles

The [Git Hub][this-github-xubuntu-vnc-node] repository contains several Dockerfiles that can be used to build the images.

- `Dockerfile.node`  
  
  This is the main Dockerfile for building the `latest` image tag based on the `accetto/xubuntu-vnc:latest` tag by default.

  However, by providing the `BASETAG` build argument it is possible to build images based on other base tags, for example `accetto/xubuntu-vnc:lab`.

- `Dockerfile.node.firefox`  
  
  This Dockerfile is for building the `firefox` image tag, which is based on the `accetto/xubuntu-vnc-firefox:latest` tag and therefore includes also [Firefox][firefox] web browser and the **plus** features

- `Dockerfile.node.chromium`  
  
  This Dockerfile is for building the `chromium` image tag, which is based on the `accetto/xubuntu-vnc-chromium:latest` tag and therefore includes also [Chromium][chromium] web browser

### Ports

The image exposes only the TCP port **5901** and therefore the containers consume only one TCP port (per container) on the host computer.

### Volumes

The containers do not create or use any external volumes by default. However, the following folders make good mounting points: `/home/headless/Documents/`, `/home/headless/Downloads/`, `/home/headless/Pictures/`, `/home/headless/Public/`

Both **named volumes** and **bind mounts** can be used. More about volumes can be found in the [Docker documentation][docker-doc] (e.g. [Manage data in Docker][docker-doc-managing-data]).

### Container user

Containers created from these images run under the default non-root application user **headless** (ID 1001), unless overridden. For more description check the base image [accetto/xubuntu-vnc][accetto-docker-xubuntu-vnc] or [Wiki][this-wiki].

### Using headless containers

The containers are intended to be used through a **VNC Viewer** (e.g. [TigerVNC][tigervnc] or [TightVNC][tightvnc]). The viewer should connect to the host running the container, pointing to its TCP port mapped to the container's port **5901**.

## Issues

If you have found a problem or you just have a question, please check the [Issues][this-issues] and the [Wiki][this-wiki] first. Please do not overlook the closed issues.

If you do not find a solution, you can file a new issue. The better you describe the problem, the bigger the chance it'll be solved soon.

## Credits

Credit goes to all the countless people and companies, who contribute to open source community and make so many dreamy things real.

***

[this-docker]: https://hub.docker.com/r/accetto/xubuntu-vnc-node/
[this-github-xubuntu-vnc-node]: https://github.com/accetto/xubuntu-vnc/tree/master/docker/xubuntu-vnc-node

[this-github]: https://github.com/accetto/xubuntu-vnc/
[this-changelog]: https://github.com/accetto/xubuntu-vnc/blob/master/CHANGELOG.md
[this-wiki]: https://github.com/accetto/xubuntu-vnc/wiki

[this-issues]: https://github.com/accetto/xubuntu-vnc/issues

[this-screenshot-container]: https://raw.githubusercontent.com/accetto/xubuntu-vnc/master/docker/xubuntu-vnc-node/xubuntu-vnc-node.jpg

[accetto-docker-xubuntu-vnc]: https://hub.docker.com/r/accetto/xubuntu-vnc/

[docker-doc]: https://docs.docker.com/
[docker-doc-managing-data]: https://docs.docker.com/storage/

[docker-ubuntu]: https://hub.docker.com/_/ubuntu/
[tigervnc]: http://tigervnc.org
[tightvnc]: http://www.tightvnc.com
[xfce]: http://www.xfce.org

[chromium]: https://www.chromium.org/Home
[curl]: http://manpages.ubuntu.com/manpages/bionic/man1/curl.1.html
[firefox]: https://www.mozilla.org
[nodejs]: https://nodejs.org/en/
[npm]: https://www.npmjs.com/
[vscode]: https://code.visualstudio.com/
