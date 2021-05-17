#!/bin/bash
# ----------
# SPDX-License-Identifier: Apache-2.0
# ----------
#
echo "Blockchain network landing..."

docker-compose -f ./docker-compose.yaml down

echo "Sleep 3 seconds"
sleep 3

# echo "Force shutdown"
# docker rm --force $(docker ps -a --filter "name=ocean")
# docker container stop $(docker container ls -aq)
# docker container rm $(docker container ls -aq)

echo "List Docker containers"
docker ps -a
