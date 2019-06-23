# CHANGELOG

## Project `accetto/xubuntu-vnc`

[Git Hub][this-github] - [Wiki][this-wiki]

***

### Version 19.06

#### accetto/xubuntu-vnc

Initial version derived from the version **19.06** of [accetto/ubuntu-vnc-xfce][accetto-ubuntu-vnc-xfce] and redesigned:

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
