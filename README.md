# pcdet-docker
This is a Dockerfile for 
PCDet (https://github.com/sshaoshuai/PCDet)

There is a Docker Hub Repo associated with this repo at: 
https://hub.docker.com/r/trn84/repo

So you can pull the image with:
```docker pull trn84/repo:latest```


-------------------

Contents:

`Dockerfile` This is the as-is docker image that provides everything to clone, install and run the PCDet repo.

`Dockerfile.ldap` This files extends the `pcdet-docker` image to be able to be used as non-root user (i.e. LDAP authed). Furthermore, additional dependencies are installed for use with JupyterLab.

`build.sh` This script build the base image as `pcdet-docker` and passes the LDAP users/groups into the second build image called `pcdet-docker-ldap`.

`start-as-root.sh` This script starts the container in detached mode as root and add the SUDO_USER parameter into the sudoers list. It is important that this script is executed as the user that is going to be used inside the container. Also here are all paths defined like KITTI path, Workspace Path, pretrained_models etc.

`enter-with-user.sh` This script is used to enter the container with the given user. Please be aware that the default `/etc/bash.bashrc is used as rc-file and that the home inside the container is always at `/root`.

`run.sh` This can be used when no non-root user is required.

`tools` In this folder random scripts are collected (to be removed in the future).


ToDo's:

* Fix home directory. The container could mount the host's user home directory but this brings other problems.
* Fix .env and .bashrc file. The user would like to pass the desired environment during entering into the container.


