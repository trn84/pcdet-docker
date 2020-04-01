#!/bin/bash

# Docker Arguments
container="$USER-pcdet"
image="pcdet-docker-ldap"

# Designated SUDO user inside container
sudo_user=$USER

# Stuff for JupyterLab
jupyter_port="4222"
hostname="10.10.88.10"

# PCDet Arguments
KITTI_BASE_PATH="/raid/data/Datasets/PublicDatasets/KITTI/3D-object-detection"

# Fresh start?
docker stop $container
docker rm $container

echo "1. Container Starting as root..."
docker run -dit \
        --name=$container \
	--hostname="inside-docker" \
	--privileged \
        --runtime=nvidia \
        --device /dev/dri \
        --volume="/tmp/.X11-unix:/tmp/.X11-unix:ro" \
	-e SUDO_USER=$sudo_user \
        --env="DISPLAY" \
        --env="QT_X11_NO_MITSHM=1" \
        -p $jupyter_port:8888 \
        -v $HOME:/$HOME \
	-v $KITTI_BASE_PATH/training:/kitti/training:ro \
        -v $KITTI_BASE_PATH/testing:/kitti/testing:ro \
        $image
echo "2. Container Running as root..."
