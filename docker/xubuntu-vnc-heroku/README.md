# Headless Ubuntu/Xfce container with VNC and Heroku-CLI for JavaScript development (with PostgreSQL)

## accetto/xubuntu-vnc-heroku-js-postgresql

[Docker Hub][this-docker] - [Git Hub][this-github] - [Changelog][this-changelog] - [Wiki][this-wiki] - [Hierarchy][this-wiki-image-hierarchy]

***

**Attention!** This repository is **retired** and **archived**. It will not be developed any further and the related images on Docker Hub will not be rebuilt any more. They will phase out and they will be deleted after becoming too old. Please use the newer **third generation** (G3) repositories [accetto/headless-coding-g3][accetto-github-headless-coding-g3] and [accetto/headless-drawing-g3][accetto-github-headless-drawing-g3] and the related images on Docker Hub instead. If you still need images based on `Ubuntu 18.04 LTS`, then use the **second generation** (G2) repository [accetto/xubuntu-vnc-novnc][accetto-github-xubuntu-vnc-novnc], which will be still maintained.

***

![badge-docker-pulls][badge-docker-pulls]
![badge-docker-stars][badge-docker-stars]
![badge-github-release][badge-github-release]
![badge-github-release-date][badge-github-release-date]

***

**WARNING** about images with Firefox

Starting from the release **20.10.1**, there is no single-process Firefox image and the multi-process mode is always enabled. Be aware, that multi-process requires larger shared memory (`/dev/shm`). At least 256MB is recommended. Please check the [Firefox multi-process][that-wiki-firefox-multiprocess] page in Wiki for more information and the instructions, how to set the shared memory size in different scenarios.

***

This repository contains resources for building Docker images based on [Ubuntu][docker-ubuntu] with [Xfce][xfce] desktop environment, [VNC][tigervnc] server for headless use, JavaScript development platform, [Heroku-CLI][heroku-cli] toolkit and [PostgreSQL][postgresql] database.

The images are part of the growing [image hierarchy][this-wiki-image-hierarchy] and they are based on [accetto/xubuntu-vnc-typescript][accetto-docker-xubuntu-vnc-typescript]. They inherit all the features and therefore not the whole description will be repeated here.

The `latest` image inherits among others

- utilities **ping**, **wget**, **zip**, **unzip**, **sudo**, [curl][curl], [git][git], [fakeroot][fakeroot], **rpm** (Ubuntu distribution)
- utility **gdebi** lets  you install local `.deb` packages resolving and installing their dependencies (Ubuntu distribution)
- popular text editors [vim][vim] and [nano][nano] (Ubuntu distribution)
- lite but advanced graphical editor [mousepad][mousepad] (Ubuntu distribution)
- [xfce4-screenshooter][screenshooter] and image viewer [ristretto][ristretto] (Ubuntu distribution)
- current version of [tini][tini] as the entry-point initial process (PID 1)
- current version of JSON processor [jq][jq]
- current version [Node.js][nodejs] JavaScript-based development platform
- [npm][npm] package manager for Node.js (included with Node.js)
- current version of [Visual Studio Code][vscode] developer editor
- current version of [TypeScript][typescript] programming language

and adds

- current version of [Heroku-CLI][heroku-cli] toolkit
- [PostgreSQL][postgresql] database (Ubuntu distribution)

The included features allow, for example, to complete the whole tutorial [Getting Started on Heroku with Node.js][heroku-getting-started-tutorial] inside the container, including the steps requiring a database.

The history of notable changes is documented in the [CHANGELOG][this-changelog].

![container-screenshot][this-screenshot-container]

### Image tags

The following image tags are regularly maintained and rebuilt:

- `latest` is based on `accetto/xubuntu-vnc-typescript:latest`

    ![badge-VERSION_STICKER_LATEST][badge-VERSION_STICKER_LATEST]
    ![badge-github-commit-latest][badge-github-commit-latest]

- `firefox` is based on `accetto/xubuntu-vnc-firefox:latest` and it includes also [Firefox][firefox] web browser and the **plus** features. Be aware that Firefox uses multi-process and therefore requires larger shared memory. See the [Firefox multi-process][this-wiki-firefox-multiprocess] page in Wiki for more information and the instructions, how to set the shared memory size in different scenarios.

    ![badge-VERSION_STICKER_FIREFOX][badge-VERSION_STICKER_FIREFOX]
    ![badge-github-commit-firefox][badge-github-commit-firefox]

- `chromium` is based on `accetto/xubuntu-vnc-typescript:chromium` and it includes also [Chromium][chromium] web browser

    ![badge-VERSION_STICKER_CHROMIUM][badge-VERSION_STICKER_CHROMIUM]
    ![badge-github-commit-chromium][badge-github-commit-chromium]

### Dockerfiles

The [Git Hub][this-github-xubuntu-vnc-heroku] repository contains several Dockerfiles that can be used to build the images.

- `Dockerfile.heroku.js`  
  
  This is the main Dockerfile for building the `latest` image tag based on the `accetto/xubuntu-vnc-typescript:latest` tag by default.

  However, by providing the `BASETAG` build argument it is possible to build images based on other base tags, for example `accetto/xubuntu-vnc-typescript:firefox`. The `firefox` and `chromium` tags are built that way.

### Ports

The image exposes only the TCP port **5901** and therefore the containers consume only one TCP port (per container) on the host computer.

Other ports can be easily exposed using the `docker run` arguments. For example, the following container will expose its internal port **5000** and bind it to the next free TCP port on the host computer:

```shell
docker run -itP --rm -p 5000 accetto/xubuntu-vnc-heroku-js-postgresql
```

### Volumes

The containers do not create or use any external volumes by default. However, the following folders make good mounting points: `/home/headless/Documents/`, `/home/headless/Downloads/`, `/home/headless/Pictures/`, `/home/headless/Public/`

Both **named volumes** and **bind mounts** can be used. More about volumes can be found in the [Docker documentation][docker-doc] (e.g. [Manage data in Docker][docker-doc-managing-data]).

The folder `/srv/projects` is intended as the working folder for development and it can be mounted to an external volume or folder if you want to keep the projects outside the container.

The working folder can be changed through the build argument `ARG_PROJECTS_DIR`. The path is also available to scripts through the environment variable `PROJECTS_DIR`.

For example, the following container would use the local folder **my_apps**:

```shell
docker run -dP -v /my_apps:/srv/projects accetto/xubuntu-vnc-heroku-js-postgresql

# or using the newer syntax

docker run -dP --mount source=/my_apps,target=/srv/projects accetto/xubuntu-vnc-heroku-js-postgresql
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

[this-docker]: https://hub.docker.com/r/accetto/xubuntu-vnc-heroku-js-postgresql
[this-github-xubuntu-vnc-heroku]: https://github.com/accetto/xubuntu-vnc/tree/master/docker/xubuntu-vnc-heroku

[this-github]: https://github.com/accetto/xubuntu-vnc/
[this-changelog]: https://github.com/accetto/xubuntu-vnc/blob/master/CHANGELOG.md

[this-wiki]: https://github.com/accetto/xubuntu-vnc/wiki
[this-wiki-image-hierarchy]: https://github.com/accetto/xubuntu-vnc/wiki/Image-hierarchy
[this-wiki-firefox-multiprocess]: https://github.com/accetto/xubuntu-vnc/wiki/Firefox-multiprocess

[this-issues]: https://github.com/accetto/xubuntu-vnc/issues

[this-screenshot-container]: https://raw.githubusercontent.com/accetto/xubuntu-vnc/master/docker/xubuntu-vnc-heroku/xubuntu-vnc-heroku.jpg

[accetto-docker-xubuntu-vnc]: https://hub.docker.com/r/accetto/xubuntu-vnc/
[accetto-docker-xubuntu-vnc-typescript]: https://hub.docker.com/r/accetto/xubuntu-vnc-typescript

[docker-doc]: https://docs.docker.com/
[docker-doc-managing-data]: https://docs.docker.com/storage/

[docker-ubuntu]: https://hub.docker.com/_/ubuntu/

[accetto-github-xubuntu-vnc-novnc]: https://github.com/accetto/xubuntu-vnc-novnc/

[accetto-github-headless-coding-g3]: https://github.com/accetto/headless-coding-g3
[accetto-github-headless-drawing-g3]: https://github.com/accetto/headless-drawing-g3

[chromium]: https://www.chromium.org/Home
[curl]: http://manpages.ubuntu.com/manpages/bionic/man1/curl.1.html
[fakeroot]: http://manpages.ubuntu.com/manpages/bionic/man1/fakeroot-tcp.1.html
[firefox]: https://www.mozilla.org
[git]: https://git-scm.com/
[heroku-cli]: https://devcenter.heroku.com/articles/heroku-cli
[heroku-getting-started-tutorial]: https://devcenter.heroku.com/articles/getting-started-with-nodejs
[jq]: https://stedolan.github.io/jq/
[nano]: https://www.nano-editor.org/
[nodejs]: https://nodejs.org/en/
[npm]: https://www.npmjs.com/
[postgresql]: https://www.postgresql.org/
[ristretto]: https://docs.xfce.org/apps/ristretto/start
[screenshooter]: https://docs.xfce.org/apps/screenshooter/start
[tigervnc]: http://tigervnc.org
[tightvnc]: http://www.tightvnc.com
[tini]: https://github.com/krallin/tini
[typescript]: https://www.typescriptlang.org/
[vim]: https://www.vim.org/
[vscode]: https://code.visualstudio.com/
[xfce]: http://www.xfce.org

<!-- docker badges -->

[badge-docker-pulls]: https://badgen.net/docker/pulls/accetto/xubuntu-vnc-heroku-js-postgresql?icon=docker&label=pulls

[badge-docker-stars]: https://badgen.net/docker/stars/accetto/xubuntu-vnc-heroku-js-postgresql?icon=docker&label=stars

<!-- github badges -->

[badge-github-release]: https://badgen.net/github/release/accetto/xubuntu-vnc?icon=github&label=release

[badge-github-release-date]: https://img.shields.io/github/release-date/accetto/xubuntu-vnc?logo=github

<!-- latest tag badges -->

[badge-VERSION_STICKER_LATEST]: https://badgen.net/badge/version%20sticker/ubuntu18.04.5-node14.16.0-npm6.14.11-code1.54.3-tsc4.2.3-heroku7.51.0-psql10.16/blue

[badge-github-commit-latest]: https://images.microbadger.com/badges/commit/accetto/xubuntu-vnc-heroku-js-postgresql.svg

<!-- chromium tag badges -->

[badge-VERSION_STICKER_CHROMIUM]: https://badgen.net/badge/version%20sticker/ubuntu18.04.5-node14.16.0-npm6.14.11-code1.54.3-tsc4.2.3-heroku7.51.0-psql10.16-chromium89.0.4389.82/blue

[badge-github-commit-chromium]: https://images.microbadger.com/badges/commit/accetto/xubuntu-vnc-heroku-js-postgresql:chromium.svg

<!-- firefox tag badges -->

[badge-VERSION_STICKER_FIREFOX]: https://badgen.net/badge/version%20sticker/ubuntu18.04.5-node14.16.0-npm6.14.11-code1.54.3-tsc4.2.3-heroku7.51.0-psql10.16-firefox86.0/blue

[badge-github-commit-firefox]: https://images.microbadger.com/badges/commit/accetto/xubuntu-vnc-heroku-js-postgresql:firefox.svg
