#!/bin/bash

# Docker Arguments
container="trn-pcdet"

echo "3. Jupyter Lab Starting as ${USER}..."
docker exec -it -u $(id -u):$(id -g) $container \
	bash --rcfile /root/.bashrc
#	bash -c "jupyter lab \
#        --allow-root \
#        --NotebookApp.token='al_token' \
#        --notebook-dir=$HOME \
#        --ip 0.0.0.0 \
#        --no-browser"
#echo "4. Jupyter Lab Running as ${USER}..."
#echo "5. Visit: http://${hostname}:${jupyter_port}/lab"
