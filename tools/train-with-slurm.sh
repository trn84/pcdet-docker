#!/bin/bash
#SBATCH --job-name "$USER-pcdet"

#SBATCH --time 240:00:00

# SLURM Arguments
NUM_GPU=2
TIMEOUT="240:00:00"

# Docker Arguments
project="pcdet"
#container="$USER-$project" Do not use a name if container shall be deleted after job is done
#image="pcdet-docker-ldap"
image="nvidia/cuda:10.0-base"

# PCDet Arguments
KITTI_BASE_PATH="/data/projects/2020_trn_Datasets/PublicDatasets/KITTI/3D-object-detection"
PCDET_BASE_PATH="/data/projects/2020_trn_pcdet"

# Hyperparams
CONFIG_PATH="second.yml"

srun --gres=gpu:volta:$NUM_GPU \
     --job-name "$USER-$project" \
     --time $TIMEOUT \
     --container-image=$image \
     --container-workdir=/root \
     --container-mounts="$KITTI_BASE_PATH/testing:/kitti/testing,$PCDET_BASE_PATH:/root,$KITTI_BASE_PATH/training:/kitti/training" \
     bash -c "echo $USER ; nvidia-smi ; ls /root ; ls  /kitti/training ; pwd ; ls /kitti/testing"
#,$KITTI_BASE_PATH/testing:/root/PCDet/data/kitti/testing,$PCDET_BASE_PATH:/root" \
