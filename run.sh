KITTI_BASE_PATH="/raid/data/projects/2020_trn_Datasets/PublicDatasets/KITTI/3D-object-detection"

docker run -it \
        --runtime=nvidia \
        --net=host \
        --privileged=true \
        --ipc=host \
        --volume="/tmp/.X11-unix:/tmp/.X11-unix:ro" \
        --env="DISPLAY" \
        --env="QT_X11_NO_MITSHM=1" \
	--hostname="inside-DOCKER" \
	--name="pcdet" \
        -v $PWD/pretrained_models:/root/pretrained_models \
	-v $PWD/persistent:/root/persistent \
	-v $KITTI_BASE_PATH/training:/kitti/training:ro \
        -v $KITTI_BASE_PATH/testing:/kitti/testing:ro \
	pcdet-docker bash
