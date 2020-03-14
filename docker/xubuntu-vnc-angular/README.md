# Headless Ubuntu/Xfce container with VNC for Angular development

## accetto/xubuntu-vnc-angular

[Docker Hub][this-docker] - [Git Hub][this-github] - [Changelog][this-changelog] - [Wiki][this-wiki] - [Hierarchy][this-wiki-image-hierarchy]

***

![badge-docker-pulls][badge-docker-pulls]
![badge-docker-stars][badge-docker-stars]
![badge-github-release][badge-github-release]
![badge-github-release-date][badge-github-release-date]

***

**WARNING** for Windows users

**Docker Desktop** (Docker for Windows) version **2.2.0.0** has introduced a new way of working with host's files. Unfortunately even the current version **2.2.0.3** leaves several issues with **bind mounts** unresolved. For example, I've found that **Firefox profiles** stored in bound host's folders don't persist modifications correctly. Firefox profiles stored in containers itself (writable layer) or on Docker managed volumes work correctly. If you need to use bind mounts, I wouldn't recommend upgrading to version 2.2 yet, because downgrading is not possible. The only way is to completely re-install the last working version **2.1.0.5**. However, you'll loose all the images and containers, so backup them first.

***

This repository contains resources for building Docker images based on [Ubuntu][docker-ubuntu] with [Xfce][xfce] desktop environment, [VNC][tigervnc] server for headless use and with JavaScript development platform for [Angular][angular] development.

The images are part of the growing [image hierarchy][this-wiki-image-hierarchy] and they are based on [accetto/xubuntu-vnc-typescript][accetto-docker-xubuntu-vnc-typescript]. They inherit all the features and therefore not the whole description will be repeated here.

The `latest` image inherits among others

- utilities **ping**, **wget**, **zip**, **unzip**, **sudo**, [curl][curl], [git][git] (Ubuntu distribution)
- utility **gdebi** lets  you install local `.deb` packages resolving and installing their dependencies (Ubuntu distribution)
- popular text editor [vim][vim] (Ubuntu distribution)
- lite but advanced graphical editor [mousepad][mousepad] (Ubuntu distribution)
- [xfce4-screenshooter][screenshooter] and image viewer [ristretto][ristretto] (Ubuntu distribution)
- current version of [tini][tini] as the entry-point initial process (PID 1)
- current version of JSON processor [jq][jq]
- current version [Node.js][nodejs] JavaScript-based development platform
- [npm][npm] package manager for Node.js (included with Node.js)
- current version of [Visual Studio Code][vscode] developer editor
- current version of [TypeScript][typescript] programming language

and adds

- current version of [Angular][angular] CLI

The history of notable changes is documented in the [CHANGELOG][this-changelog].

![container-screenshot][this-screenshot-container]

### Image tags

The following image tags are regularly maintained and rebuilt:

- `latest` is based on `accetto/xubuntu-vnc-typescript:latest`

    ![badge-VERSION_STICKER_LATEST][badge-VERSION_STICKER_LATEST]
    ![badge-github-commit-latest][badge-github-commit-latest]

- `firefox` is based on `accetto/xubuntu-vnc-typescript:firefox` and it includes also [Firefox][firefox] web browser

    ![badge-VERSION_STICKER_FIREFOX][badge-VERSION_STICKER_FIREFOX]
    ![badge-github-commit-firefox][badge-github-commit-firefox]

- `chromium` is based on `accetto/xubuntu-vnc-typescript:chromium` and it includes also [Chromium][chromium] web browser

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

[chromium]: https://www.chromium.org/Home
[curl]: http://manpages.ubuntu.com/manpages/bionic/man1/curl.1.html
[firefox]: https://www.mozilla.org
[git]: https://git-scm.com/
[jq]: https://stedolan.github.io/jq/
[nodejs]: https://nodejs.org/en/
[npm]: https://www.npmjs.com/
[ristretto]: https://docs.xfce.org/apps/ristretto/start
[screenshooter]: https://docs.xfce.org/apps/screenshooter/start
[tigervnc]: http://tigervnc.org
[tightvnc]: http://www.tightvnc.com
[tini]: https://github.com/krallin/tini
[typescript]: https://www.typescriptlang.org/
[vscode]: https://code.visualstudio.com/
[xfce]: http://www.xfce.org

[angular]: https://angular.io/

<!-- docker badges -->

[badge-docker-pulls]: https://badgen.net/docker/pulls/accetto/xubuntu-vnc-angular?icon=docker&label=pulls

[badge-docker-stars]: https://badgen.net/docker/stars/accetto/xubuntu-vnc-angular?icon=docker&label=stars

<!-- github badges -->

[badge-github-release]: https://badgen.net/github/release/accetto/xubuntu-vnc?icon=github&label=release

[badge-github-release-date]: https://img.shields.io/github/release-date/accetto/xubuntu-vnc?logo=github

<!-- latest tag badges -->

[badge-VERSION_STICKER_LATEST]: https://badgen.net/badge/version%20sticker/ubuntu18.04.4-node12.16.1-npm6.13.4-code1.43.0-tsc3.8.3-angular9.0.6/blue

[badge-github-commit-latest]: https://images.microbadger.com/badges/commit/accetto/xubuntu-vnc-angular.svg

<!-- chromium tag badges -->

[badge-VERSION_STICKER_CHROMIUM]: https://badgen.net/badge/version%20sticker/ubuntu18.04.4-node12.16.1-npm6.13.4-code1.43.0-tsc3.8.3-angular9.0.6-chromium80.0.3987.87/blue

[badge-github-commit-chromium]: https://images.microbadger.com/badges/commit/accetto/xubuntu-vnc-angular:chromium.svg

<!-- firefox tag badges -->

[badge-VERSION_STICKER_FIREFOX]: https://badgen.net/badge/version%20sticker/ubuntu18.04.4-node12.16.1-npm6.13.4-code1.43.0-tsc3.8.3-angular9.0.6-firefox74.0/blue

[badge-github-commit-firefox]: https://images.microbadger.com/badges/commit/accetto/xubuntu-vnc-angular:firefox.svg
