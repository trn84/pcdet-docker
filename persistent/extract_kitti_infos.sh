#!/bin/sh

PATH_IN_DOCKER=/root/PCDet/data/kitti
PATH_ON_HOST=/home/bt/KITTI/3D-object-detection/

docker cp pcdet:$PATH_IN_DOCKER/kitti_dbinfos_train.pkl $PATH_ON_HOST
docker cp pcdet:$PATH_IN_DOCKER/kitti_infos_test.pkl $PATH_ON_HOST
docker cp pcdet:$PATH_IN_DOCKER/kitti_infos_train.pkl $PATH_ON_HOST
docker cp pcdet:$PATH_IN_DOCKER/kitti_infos_trainval.pkl $PATH_ON_HOST
docker cp pcdet:$PATH_IN_DOCKER/kitti_infos_val.pkl $PATH_ON_HOST
docker cp pcdet:$PATH_IN_DOCKER/gt_database $PATH_ON_HOST

sudo chown $(id -u):$(id -g) -R $PATH_ON_HOST/gt_database
sudo chown $(id -u):$(id -g) -R $PATH_ON_HOST/*.pkl




