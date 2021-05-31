#!/bin/bash
# ----------
# SPDX-License-Identifier: Apache-2.0
# ----------
#
echo "Blockchain network landing..."

docker-compose -f ./docker-compose.yaml down 

sleep 2

docker ps -a

echo " "
echo "END"

# echo "Force shutdown"
# docker rm --force $(docker ps -a --filter "name=drink")
# docker container stop $(docker container ls -aq)
# docker container rm $(docker container ls -aq)
