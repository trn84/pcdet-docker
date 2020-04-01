#!/bin/bash

set -e

cp /tmp/passwd /etc/passwd
cp /tmp/group /etc/group

# Add $USER to sudoers
adduser $SUDO_USER sudo
echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Allow /bin/bash without password for $USER
#echo "$USER ALL = NOPASSWD: /bin/bash" >> /etc/sudoers

exec "$@"
