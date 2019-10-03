# Headless Ubuntu/Xfce container with VNC

## accetto/xubuntu-vnc

[Docker Hub][this-docker] - [Git Hub][this-github] - [Changelog][this-changelog] - [Wiki][this-wiki] - [Hierarchy][this-wiki-image-hierarchy]

***

**TIP** If you need also [noVNC][novnc], then you can use the image [accetto/xubuntu-vnc-novnc][accetto-docker-xubuntu-vnc-novnc], which is the base of another family of application images ([image hierarchy][accetto-xubuntu-vnc-novnc-wiki-image-hierarchy]).

***

This repository contains resources for building Docker images based on [Ubuntu][docker-ubuntu] with [Xfce][xfce] desktop environment and [VNC][tigervnc] server for headless use.

The main image is a streamlined and simplified version of my other image [accetto/ubuntu-vnc-xfce][accetto-docker-ubuntu-vnc-xfce] and it is part of the growing [image hierarchy][this-wiki-image-hierarchy].

The main features and components of the images are:

- light-weight [Xfce][xfce] desktop environment
- high-performance [TigerVNC][tigervnc] server and client
- popular text editor [vim][vim]
- lite but advanced graphical editor [mousepad][mousepad]
- **ping**, **zip** and **unzip** utilities
- [tini][tini] as the entry-point initial process (PID 1)
- support for overriding both the container user account and its group
- **sudo** command

The history of notable changes is documented in the [CHANGELOG][this-changelog].

![container-screenshot][this-screenshot-container]

### Image tags

The following image tags are regularly maintained and rebuilt:

- `latest` is based on `ubuntu:latest`  

    [![version badge](https://images.microbadger.com/badges/version/accetto/xubuntu-vnc:latest.svg)](https://microbadger.com/images/accetto/xubuntu-vnc:latest "Get your own version badge on microbadger.com") [![size badge](https://images.microbadger.com/badges/image/accetto/xubuntu-vnc:latest.svg)](https://microbadger.com/images/accetto/xubuntu-vnc:latest "Get your own image badge on microbadger.com")

- `lab` is also based on `ubuntu:latest`, but built with `ARG_SUPPORT_USER_GROUP_OVERRIDE`  

    [![version badge](https://images.microbadger.com/badges/version/accetto/xubuntu-vnc:lab.svg)](https://microbadger.com/images/accetto/xubuntu-vnc:lab "Get your own version badge on microbadger.com") [![size badge](https://images.microbadger.com/badges/image/accetto/xubuntu-vnc:lab.svg)](https://microbadger.com/images/accetto/xubuntu-vnc:lab "Get your own image badge on microbadger.com")

There are also archive images that are tagged like `ubuntu18.04.2` and similar. Those are previous production images and they can be useful for testing.

Sometimes you can also spot tags like `dev`, `lab-dev` and similar. Those are temporary images under development and they should not be used.

### Dockerfiles

The [Git Hub][this-github-xubuntu-vnc] repository contains several Dockerfiles that can be used to build the images.

- `Dockerfile`  
  
  This is the main *Dockerfile* for building the `latest` image tag based on the `ubuntu:latest` tag by default.  

  However, by providing the `BASETAG` build argument it is possible to build images based on other Ubuntu tags, for example `ubuntu:rolling`.  

  ```shell
  docker build --build-arg BASETAG=rolling -t accetto/xubuntu-vnc:rolling
  ```

  By providing the `ARG_SUPPORT_USER_GROUP_OVERRIDE` build argument it is possible to build the `lab` images that support overriding the container user group. Note that the value of the build argument does not really matter, anything means *true*.

  ```shell
  docker build --build-arg ARG_SUPPORT_USER_GROUP_OVERRIDE=yes -t accetto/xubuntu-vnc:lab
  ```

### Ports

The image exposes only the TCP port **5901** and therefore the containers consume only one TCP port (per container) on the host computer.

### Volumes

The containers do not create or use any external volumes by default. However, the following folders make good mounting points: `/home/headless/Documents/`, `/home/headless/Downloads/`, `/home/headless/Pictures/`, `/home/headless/Public/`

Both **named volumes** and **bind mounts** can be used. More about volumes can be found in the [Docker documentation][docker-doc] (e.g. [Manage data in Docker][docker-doc-managing-data]).

## Using headless containers

The containers are intended to be used through a **VNC Viewer** (e.g. [TigerVNC][tigervnc] or [TightVNC][tightvnc]). The viewer should connect to the host running the container, pointing to its TCP port mapped to the container's port **5901**.

The default VNC password is **headless**.

## Container user accounts

Containers created from this image run under the **default application user** (headless, 1001:0). The password is set from the environment variable **VNC_PW** (**headless** by default) and it can be changed by the user inside the container using the following command:

```shell
passwd
```

The **sudo** command allows user elevation, so the default application user can, for example, install new applications.

The following example shows how to install **git**:

```shell
sudo apt-get update
sudo apt-get install -y git
```

Note that the default application account's **group membership** (group zero) does not give it automatically the privileges of the **root** user. Technical details will be described in [Wiki][this-wiki].

The container user ID (1001 by default) can be changed by creating the container using the `--user` parameter, for example:

```shell
docker run -itP --rm --user 2019 accetto/xubuntu-vnc
```

The image supports also overriding the container user's group ID (0 by default). However, the image must be built with the argument `ARG_SUPPORT_USER_GROUP_OVERRIDE`. Otherwise the following command line would fail:

```shell
### This will fail (Permission denied)
docker run -itP --rm --user 2019:2000 accetto/xubuntu-vnc:latest

### This will work (image built with ARG_SUPPORT_USER_GROUP_OVERRIDE)
docker run -itP --rm --user 2019:2000 accetto/xubuntu-vnc:lab
```

The image tag `lab` is build just that way.

Note that only numerical ID and GID are supported. Technical details will be described in [Wiki][this-wiki].

## Running containers in background (detached)

The following container will keep running in the background and it will listen on an automatically selected TCP port on the host computer:

```shell
docker run -dP accetto/xubuntu-vnc
```

The following container will listen on the host's TCP port **25901**:

```shell
docker run -d -p 25901:5901 accetto/xubuntu-vnc
```

The following container will create (or re-use) the local named volume **my\_Downloads** mounted as `/home/headless/Downloads`:

```shell
docker run -dP -v my_Downloads:/home/headless/Downloads accetto/xubuntu-vnc
```

or using the newer syntax with **--mount** flag:

```shell
docker run -dP --mount source=my_Downloads,target=/home/headless/Downloads accetto/xubuntu-vnc
```

## Running containers in foreground (interactively)

The image supports the following container start-up options: `--wait` (default), `--skip`, `--debug` (also `--tail-log`) and `--help`.

The following container will print out the help and then it will remove itself:

```shell
docker run --rm accetto/xubuntu-vnc --help
```

Excerpt from the output describing the options:

```shell
-w, --wait      (default) Keeps the UI and the vnc server up until SIGINT or SIGTERM are received.
                An optional command can be executed after the vnc starts up.
                example: docker run -d -P accetto/xubuntu-vnc
                example: docker run -it -P --rm accetto/xubuntu-vnc bash

-s, --skip      Skips the vnc startup and just executes the provided command.
                example: docker run -it -P --rm accetto/xubuntu-vnc --skip echo $BASH_VERSION

-d, --debug     Executes the vnc startup, prints some additional info and tails the VNC logs.
                Any parameters after '--debug' are ignored. CTRL-C stops the container.
                example: docker run -it -P --rm accetto/xubuntu-vnc --debug

-t, --tail-log  similar to '--debug' but no additional diagnostic info

-h, --help      Prints out this help.
                example: docker run --rm accetto/xubuntu-vnc
```

It should be noticed, that the `--debug` start-up option does not show the command prompt, even if the docker run arguments `-it` are provided. This is because the container is watching the incoming VNC connections and prints out the logs in real time. However, it is easy to attach to the running container from the second terminal window.

In the first terminal window on the host computer, create a new container named, for example, **foo**:

```shell
docker run --rm --name foo accetto/xubuntu-vnc --debug
```

In the second terminal window, execute the shell inside the running **foo** container:

```shell
docker exec -it foo bash
```

## Issues

If you have found a problem or you just have a question, please check the [Issues][this-issues] and the [Wiki][this-wiki] first. Please do not overlook the closed issues.

If you do not find a solution, you can file a new issue. The better you describe the problem, the bigger the chance it'll be solved soon.

## Credits

Credit goes to all the countless people and companies, who contribute to open source community and make so many dreamy things real.

***

[this-docker]: https://hub.docker.com/r/accetto/xubuntu-vnc/
[this-github]: https://github.com/accetto/xubuntu-vnc/
[this-changelog]: https://github.com/accetto/xubuntu-vnc/blob/master/CHANGELOG.md

[this-wiki]: https://github.com/accetto/xubuntu-vnc/wiki
[this-wiki-image-hierarchy]: https://github.com/accetto/xubuntu-vnc/wiki/Image-hierarchy

[this-issues]: https://github.com/accetto/xubuntu-vnc/issues

[this-github-xubuntu-vnc]: https://github.com/accetto/xubuntu-vnc/tree/master/docker/xubuntu-vnc

[this-screenshot-container]: https://raw.githubusercontent.com/accetto/xubuntu-vnc/master/docker/xubuntu-vnc/xubuntu-vnc.jpg

[accetto-docker-ubuntu-vnc-xfce]: https://hub.docker.com/r/accetto/ubuntu-vnc-xfce/

[accetto-docker-xubuntu-vnc-novnc]: https://hub.docker.com/r/accetto/xubuntu-vnc-novnc
[accetto-xubuntu-vnc-novnc-wiki-image-hierarchy]: https://github.com/accetto/xubuntu-vnc-novnc/wiki/Image-hierarchy

[docker-ubuntu]: https://hub.docker.com/_/ubuntu/

[docker-doc]: https://docs.docker.com/
[docker-doc-managing-data]: https://docs.docker.com/storage/

[mousepad]: https://github.com/codebrainz/mousepad
[novnc]: https://github.com/kanaka/noVNC
[tigervnc]: http://tigervnc.org
[tightvnc]: http://www.tightvnc.com
[tini]: https://github.com/krallin/tini
[vim]: https://www.vim.org/
[xfce]: http://www.xfce.org
