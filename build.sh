#!/bin/sh

# Create base image
docker build -t pcdet-docker .

# Create custom user image
getent passwd > passwd
getent group > group

docker build -t pcdet-docker-ldap -f Dockerfile.ldap .

rm passwd
rm group
