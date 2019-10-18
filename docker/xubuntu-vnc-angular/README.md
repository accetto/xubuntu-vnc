# Headless Ubuntu/Xfce container with VNC for Angular development

## accetto/xubuntu-vnc-angular

[Docker Hub][this-docker] - [Git Hub][this-github] - [Changelog][this-changelog] - [Wiki][this-wiki] - [Hierarchy][this-wiki-image-hierarchy]

***

![badge-docker-pulls][badge-docker-pulls]
![badge-docker-stars][badge-docker-stars]
![badge-github-release][badge-github-release]
![badge-github-release-date][badge-github-release-date]

This repository contains resources for building Docker images based on [Ubuntu][docker-ubuntu] with [Xfce][xfce] desktop environment, [VNC][tigervnc] server for headless use and with JavaScript development platform for [Angular][angular] development.

The images are part of the growing [image hierarchy][this-wiki-image-hierarchy] and they are based on [accetto/xubuntu-vnc-typescript][accetto-docker-xubuntu-vnc-typescript]. They inherit all the features and therefore not the whole description will be repeated here.

The `latest` image inherits among others

- utilities **ping**, **zip**, **unzip**, **sudo**, [curl][curl], [git][git]
- [tini][tini] as the entry-point initial process (PID 1)
- [Node.js][nodejs] JavaScript-based development platform
- [npm][npm] package manager for Node.js
- [Visual Studio Code][vscode] developer editor
- [TypeScript][typescript] programming language

and adds

- [Angular][angular] CLI

The history of notable changes is documented in the [CHANGELOG][this-changelog].

![container-screenshot][this-screenshot-container]

### Image tags

The following image tags are regularly maintained and rebuilt:

- `latest` is based on `accetto/xubuntu-vnc-typescript:latest`

    ![badge-VERSION_STICKER_LATEST][badge-VERSION_STICKER_LATEST]
    ![badge-github-commit-latest][badge-github-commit-latest]

- `firefox` is based on `accetto/xubuntu-vnc-typescript:firefox` and includes also [Firefox][firefox] web browser

    ![badge-VERSION_STICKER_FIREFOX][badge-VERSION_STICKER_FIREFOX]
    ![badge-github-commit-firefox][badge-github-commit-firefox]

- `chromium` is based on `accetto/xubuntu-vnc-typescript:chromium` and includes also [Chromium][chromium] web browser

    ![badge-VERSION_STICKER_CHROMIUM][badge-VERSION_STICKER_CHROMIUM]
    ![badge-github-commit-chromium][badge-github-commit-chromium]

### Dockerfiles

The [Git Hub][this-github-xubuntu-vnc-angular] repository contains several Dockerfiles that can be used to build the images.

- `Dockerfile.angular`  
  
  This is the main Dockerfile for building the `latest` image tag based on the `accetto/xubuntu-vnc-typescript:latest` tag by default.

  However, by providing the `BASETAG` build argument it is possible to build images based on other base tags, for example `accetto/xubuntu-vnc-typescript:firefox`. The `firefox` and `chromium` tags are built that way.

### Ports

The image exposes only the TCP port **5901** and therefore the containers consume only one TCP port (per container) on the host computer.

Other ports can be easily exposed using the `docker run` arguments. For example, the following container will expose its internal port **4200** and bind it to the next free TCP port on the host computer:

```shell
docker run -itP --rm -p 4200 accetto/xubuntu-vnc-angular
```

### Angular

Angular applications listen by default on the TCP port **4200** on the **localhost** only. That is no problem, if you develop **inside** the container using the image's `firefox` or `chromium` tags. In that case you would create and start your Angular application using, for example, the following commands

```shell
ng new my-app

# and after Angular finishes creating the application

cd my-app
ng serve --open
```

Angular will display among other messages

```shell
** Angular Live Development Server is listening on localhost:4200, open your browser on http://localhost:4200/ **
```

and you can reach you application from **inside** the container with

```shell
http://localhost:4200
```

However, if you use the image's `latest` tag or you want to reach your Angular application from **outside** the container, you have to force it to listen on an interface, which is reachable from outside the container. The simplest way is to make it to listen on all interfaces:

```shell
ng serve --host 0.0.0.0
```

Make sure that you expose the port **4200** by starting the container. For example

```shell
docker run -itP --rm -p 25000:4200 accetto/xubuntu-vnc-angular
```

Now you can reach the application from your host like

```shell
http://localhost:25000
```

### Volumes

The containers do not create or use any external volumes by default. However, the following folders make good mounting points: `/home/headless/Documents/`, `/home/headless/Downloads/`, `/home/headless/Pictures/`, `/home/headless/Public/`

Both **named volumes** and **bind mounts** can be used. More about volumes can be found in the [Docker documentation][docker-doc] (e.g. [Manage data in Docker][docker-doc-managing-data]).

The folder `/usr/src` is intended as the working folder for development and it should be mounted to an external volume or folder if you want to keep the projects outside the container.

For example, the following container would use the local folder **my_apps**:

```shell
docker run -dP -v /my_apps:/usr/src accetto/xubuntu-vnc-angular

# or using the newer syntax

docker run -dP --mount source=/my_apps,target=/usr/src accetto/xubuntu-vnc-angular
```

### Container user

Containers created from these images run under the non-root **default application user** (headless, 1001:0). However, the **sudo** command allows user elevation. For more description check the base image [accetto/xubuntu-vnc][accetto-docker-xubuntu-vnc] or [Wiki][this-wiki].

### Version sticker

Version sticker serves multiple purposes that are closer described in [Wiki][this-wiki]. The **version sticker value** identifies the version of the docker image and it is persisted in it when it is built. It is also shown as a badge in the README file.

However, the script `version_sticker.sh` can be used anytime for convenient checking of the current versions of installed applications.

The script is deployed into the startup folder, which is defined by the environment variable `STARTUPDIR` with the default value of `/dockerstartup`.

If the script is executed inside a container without an argument, then it returns the **current version sticker value** of the container. This value is newly calculated and it is based on the current versions of the essential applications in the container.

The **current** version sticker value will differ from the **persisted** value, if any of the included application has been updated to another version.

If the script is called with the argument `-v` (lower case `v`), then it prints out verbose versions of the essential applications that are included in the **version sticker value**.

If it is called with the argument `-V` (upper case `v`), then it prints out verbose versions of some more applications.

Examples can be found in [Wiki][this-wiki].

### Using headless containers

The containers are intended to be used through a **VNC Viewer** (e.g. [TigerVNC][tigervnc] or [TightVNC][tightvnc]). The viewer should connect to the host running the container, pointing to its TCP port mapped to the container's port **5901**.

## Issues

If you have found a problem or you just have a question, please check the [Issues][this-issues] and the [Wiki][this-wiki] first. Please do not overlook the closed issues.

If you do not find a solution, you can file a new issue. The better you describe the problem, the bigger the chance it'll be solved soon.

## Credits

Credit goes to all the countless people and companies, who contribute to open source community and make so many dreamy things real.

***

[this-docker]: https://hub.docker.com/r/accetto/xubuntu-vnc-angular
[this-github-xubuntu-vnc-angular]: https://github.com/accetto/xubuntu-vnc/tree/master/docker/xubuntu-vnc-angular

[this-github]: https://github.com/accetto/xubuntu-vnc/
[this-changelog]: https://github.com/accetto/xubuntu-vnc/blob/master/CHANGELOG.md

[this-wiki]: https://github.com/accetto/xubuntu-vnc/wiki
[this-wiki-image-hierarchy]: https://github.com/accetto/xubuntu-vnc/wiki/Image-hierarchy

[this-screenshot-container]: https://raw.githubusercontent.com/accetto/xubuntu-vnc/master/docker/xubuntu-vnc-angular/xubuntu-vnc-angular.jpg

[accetto-docker-xubuntu-vnc]: https://hub.docker.com/r/accetto/xubuntu-vnc/
[accetto-docker-xubuntu-vnc-typescript]: https://hub.docker.com/r/accetto/xubuntu-vnc-typescript

[docker-doc]: https://docs.docker.com/
[docker-doc-managing-data]: https://docs.docker.com/storage/

[docker-ubuntu]: https://hub.docker.com/_/ubuntu/
[tigervnc]: http://tigervnc.org
[tightvnc]: http://www.tightvnc.com
[tini]: https://github.com/krallin/tini
[xfce]: http://www.xfce.org

[chromium]: https://www.chromium.org/Home
[curl]: http://manpages.ubuntu.com/manpages/bionic/man1/curl.1.html
[firefox]: https://www.mozilla.org
[git]: https://git-scm.com/
[nodejs]: https://nodejs.org/en/
[npm]: https://www.npmjs.com/
[typescript]: https://www.typescriptlang.org/
[vscode]: https://code.visualstudio.com/

[angular]: https://angular.io/

<!-- docker badges -->

[badge-docker-pulls]: https://badgen.net/docker/pulls/accetto/xubuntu-vnc-angular?icon=docker&label=pulls

[badge-docker-stars]: https://badgen.net/docker/stars/accetto/xubuntu-vnc-angular?icon=docker&label=stars

<!-- github badges -->

[badge-github-release]: https://badgen.net/github/release/accetto/xubuntu-vnc?icon=github&label=release

[badge-github-release-date]: https://img.shields.io/github/release-date/accetto/xubuntu-vnc?logo=github

<!-- latest tag badges -->

[badge-VERSION_STICKER_LATEST]: https://badgen.net/badge/version%20sticker/ubuntu18.04.3-node10.16.3-npm6.9.0-code1.39.2-tsc3.6.4-angular8.3.10/blue

[badge-github-commit-latest]: https://images.microbadger.com/badges/commit/accetto/xubuntu-vnc-angular.svg

<!-- chromium tag badges -->

[badge-VERSION_STICKER_CHROMIUM]: https://badgen.net/badge/version%20sticker/ubuntu18.04.3-node10.16.3-npm6.9.0-code1.39.2-tsc3.6.4-angular8.3.10-chromium77.0.3865.90/blue

[badge-github-commit-chromium]: https://images.microbadger.com/badges/commit/accetto/xubuntu-vnc-angular:chromium.svg

<!-- firefox tag badges -->

[badge-VERSION_STICKER_FIREFOX]: https://badgen.net/badge/version%20sticker/ubuntu18.04.3-node10.16.3-npm6.9.0-code1.39.2-tsc3.6.4-angular8.3.10-firefox69.0.2/blue

[badge-github-commit-firefox]: https://images.microbadger.com/badges/commit/accetto/xubuntu-vnc-angular:firefox.svg
