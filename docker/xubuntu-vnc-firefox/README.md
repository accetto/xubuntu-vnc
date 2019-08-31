# Headless Ubuntu/Xfce container with VNC and Firefox

## accetto/xubuntu-vnc-firefox

[Docker Hub][this-docker] - [Git Hub][this-github] - [Changelog][this-changelog] - [Wiki][this-wiki] - [Hierarchy][this-wiki-image-hierarchy]

***

This repository contains resources for building Docker images based on [Ubuntu][docker-ubuntu] with [Xfce][xfce] desktop environment, [VNC][tigervnc] server for headless use and the current [Firefox Quantum][firefox] web browser.

The main image is a streamlined and simplified version of my other image [accetto/ubuntu-vnc-xfce-firefox-plus][accetto-docker-ubuntu-vnc-xfce-firefox-plus]. The applicable **plus** features have been re-implemented because **Firefox v67** handles user profiles differently.

The images are part of the growing [image hierarchy][this-wiki-image-hierarchy] and they are based on [accetto/xubuntu-vnc][accetto-docker-xubuntu-vnc]. They inherit all the features and therefore not the whole description will be repeated here.

The `latest` image inherits among others

- utilities **ping**, **zip**, **unzip**, **sudo**
- popular text editor [vim][vim]
- lite but advanced graphical editor [mousepad][mousepad]
- [tini][tini] as the entry-point initial process (PID 1)

and adds

- [Firefox Quantum][firefox] web browser and some additional **plus** features described below

The history of notable changes is documented in the [CHANGELOG][this-changelog].

![container-screenshot][this-screenshot-container]

### Image tags

The following image tags are regularly maintained and rebuilt:

- `latest` is based on `accetto/xubuntu-vnc:latest`, it includes the **plus** features and it is built with the build argument **ARG_MOZ_FORCE_DISABLE_E10S**, so the Firefox multiprocess is **disabled** (see below)

    [![version badge](https://images.microbadger.com/badges/version/accetto/xubuntu-vnc-firefox:latest.svg)](https://microbadger.com/images/accetto/xubuntu-vnc-firefox:latest "Get your own version badge on microbadger.com") [![size badge](https://images.microbadger.com/badges/image/accetto/xubuntu-vnc-firefox:latest.svg)](https://microbadger.com/images/accetto/xubuntu-vnc-firefox:latest "Get your own image badge on microbadger.com")

- `default` is similar to `latest`, but it doesn't include the **plus** features  

    [![version badge](https://images.microbadger.com/badges/version/accetto/xubuntu-vnc-firefox:default.svg)](https://microbadger.com/images/accetto/xubuntu-vnc-firefox:default "Get your own version badge on microbadger.com") [![size badge](https://images.microbadger.com/badges/image/accetto/xubuntu-vnc-firefox:default.svg)](https://microbadger.com/images/accetto/xubuntu-vnc-firefox:default "Get your own image badge on microbadger.com")

- `multiprocess` is also similar to `latest`, but it is not built with the build argument **ARG_MOZ_FORCE_DISABLE_E10S**, so the Firefox multiprocess is **enabled**  

    [![version badge](https://images.microbadger.com/badges/version/accetto/xubuntu-vnc-firefox:multiprocess.svg)](https://microbadger.com/images/accetto/xubuntu-vnc-firefox:multiprocess "Get your own version badge on microbadger.com") [![size badge](https://images.microbadger.com/badges/image/accetto/xubuntu-vnc-firefox:multiprocess.svg)](https://microbadger.com/images/accetto/xubuntu-vnc-firefox:multiprocess "Get your own image badge on microbadger.com")

### Dockerfiles

The [Git Hub][this-github-xubuntu-vnc-firefox] repository contains several Dockerfiles that can be used to build the images.

- `Dockerfile.firefox`  
  
  This is the main Dockerfile for building the `latest` image tag based on the `accetto/xubuntu-vnc:latest` tag by default.

  However, by providing the `BASETAG` build argument it is possible to build images based on other base tags, for example `accetto/xubuntu-vnc:lab`.

  This Docker file will include also the **plus** features described below.

- `Dockerfile.firefox.default`  
  
  This Dockerfile is for building the `default` image tag, which is also based on the `accetto/xubuntu-vnc:latest`, but it does not include the **plus** features.

- `Dockerfile.firefox.myown` can be used for building images with own Firefox preferences

### Ports

The image exposes only the TCP port **5901** and therefore the containers consume only one TCP port (per container) on the host computer.

### Volumes

The containers do not create or use any external volumes by default. However, the following folders make good mounting points: `/home/headless/Documents/`, `/home/headless/Downloads/`, `/home/headless/Pictures/`, `/home/headless/Public/`

Both **named volumes** and **bind mounts** can be used. More about volumes can be found in the [Docker documentation][docker-doc] (e.g. [Manage data in Docker][docker-doc-managing-data]).

### Container user

Containers created from these images run under the non-root **default application user** (headless, 1001:0). However, the **sudo** command allows user elevation. For more description check the base image [accetto/xubuntu-vnc][accetto-docker-xubuntu-vnc] or [Wiki][this-wiki].

### Using headless containers

The containers are intended to be used through a **VNC Viewer** (e.g. [TigerVNC][tigervnc] or [TightVNC][tightvnc]). The viewer should connect to the host running the container, pointing to its TCP port mapped to the container's port **5901**.

## Firefox multi-process

Firefox multi-process (also known as **Electrolysis** or just **E10S**) causes in Docker container heavy crashing (**Gah. Your tab just crashed.**) and therefore it needs to be disabled.

In Firefox versions till **67.0.4** it could be done by setting the preferences **browser.tabs.remote.autostart** and **browser.tabs.remote.autostart.2** to **false**. However, Mozilla has removed this possibility since the Firefox version **68.0**.

Since than it can be done only by setting the following environment variable:

```bash
MOZ_FORCE_DISABLE_E10S
```

Therefore the images tagged `latest` and `default` set this variable to **1** by using the build argument **ARG_MOZ_FORCE_DISABLE_E10S**.

Note that any value will actually disable the multi-process feature, so the both following settings would have the same effect:

```bash
MOZ_FORCE_DISABLE_E10S=1
MOZ_FORCE_DISABLE_E10S=0
```

Building an image without the build argument **ARG_MOZ_FORCE_DISABLE_E10S** enables the Firefox multi-process feature. The image tagged `multiprocess` is built that way.

To check whether the Firefox multi-process is enabled or disabled, navigate the web browser to the following URL:

```bash
about:support
```

## Firefox preferences and the plus features

**Firefox** browser supports pre-configuration of user preferences.

Users can enforce their personal browser preferences if they put them into the `user.js` file and then copy it into the Firefox profile folder. The provided **plus** features make it really easy.

There is the `/home/headless/firefox.plus` folder containing the `user.js` file and the helper utility `copy_firefox_user_preferences.sh`. It will copy the `user.js` file into one or more existing Firefox profiles. The utility is easy to use, because it is interactive and it will also display the help, if started with the `-h` or `--help` argument.

To make it even more convenient, there are also desktop launchers for the utility and for the **Firefox Profile Manager**.

Recommended procedure for taking advantage of the **plus** features is:

- Start the **Firefox Profile Manager** using the desktop launcher **FF Profile Manager**. Create a new Firefox profile if there is none or you want to add one more. Wait until the profile is created and then start Firefox with it. Starting Firefox is required to create the actual profile content.
  
  **Hint**: You can also check the **Work offline** check-box before creating the profile.

  The Firefox profiles are created inside the `/home/headless/.mozilla/firefox` folder by default. Note that the `.mozilla` folder is hidden.

  Close the **Profile Manager** by pushing the **Exit** button.

- Put your personal Firefox preferences into the `user.js` file which is in the `/home/headless/firefox.plus`folder. Check the Firefox documentation (e.g. [Firefox preferences][firefox-doc-preferences]) for more information about the syntax.  
  
  **Hint**: There is also another way. You can first start Firefox, configure it and then copy the content of the `prefs.js` file from the Firefox profile folder into the `user.js` file. Then you can check the content and to keep only the preferences you really want to enforce. It's not a quick task, but you have to do it only once or until you need an update.

- Start the helper utility using the desktop launcher **Copy FF Preferences**. The utility will allow you to copy the `user.js` file to any of the existing Firefox profiles.  
  
  **Hint**: You preferences will be enforced until you delete the `user.js` file from the Firefox profile folder.

It is also very easy to build customized images with pre-filled `user.js` files. The provided `Dockerfile.firefox.myown` show how to do it. The build will take just seconds.

## Issues

If you have found a problem or you just have a question, please check the [Issues][this-issues] and the [Wiki][this-wiki] first. Please do not overlook the closed issues.

If you do not find a solution, you can file a new issue. The better you describe the problem, the bigger the chance it'll be solved soon.

## Credits

Credit goes to all the countless people and companies, who contribute to open source community and make so many dreamy things real.

***

[this-docker]: https://hub.docker.com/r/accetto/xubuntu-vnc-firefox/

[this-github]: https://github.com/accetto/xubuntu-vnc/
[this-changelog]: https://github.com/accetto/xubuntu-vnc/blob/master/CHANGELOG.md

[this-wiki]: https://github.com/accetto/xubuntu-vnc/wiki
[this-wiki-image-hierarchy]: https://github.com/accetto/xubuntu-vnc/wiki/Image-hierarchy

[this-issues]: https://github.com/accetto/xubuntu-vnc/issues

[this-github-xubuntu-vnc-firefox]: https://github.com/accetto/xubuntu-vnc/tree/master/docker/xubuntu-vnc-firefox

[this-screenshot-container]: https://raw.githubusercontent.com/accetto/xubuntu-vnc/master/docker/xubuntu-vnc-firefox/xubuntu-vnc-firefox.jpg

[accetto-docker-xubuntu-vnc]: https://hub.docker.com/r/accetto/xubuntu-vnc/
[accetto-docker-ubuntu-vnc-xfce-firefox-plus]: https://hub.docker.com/r/accetto/ubuntu-vnc-xfce-firefox-plus/

[docker-ubuntu]: https://hub.docker.com/_/ubuntu/

[docker-doc]: https://docs.docker.com/
[docker-doc-managing-data]: https://docs.docker.com/storage/

[firefox-doc-preferences]: https://developer.mozilla.org/en-US/docs/Mozilla/Preferences/A_brief_guide_to_Mozilla_preferences

[mousepad]: https://github.com/codebrainz/mousepad
[tigervnc]: http://tigervnc.org
[tightvnc]: http://www.tightvnc.com
[tini]: https://github.com/krallin/tini
[vim]: https://www.vim.org/
[xfce]: http://www.xfce.org

[firefox]: https://www.mozilla.org
