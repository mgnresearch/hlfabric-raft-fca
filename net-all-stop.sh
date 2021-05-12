#!/bin/bash
# ----------
# SPDX-License-Identifier: Apache-2.0
# ----------
#
echo "Blockchain network landing..."

echo "Corp Maputo"
./corpmaputo/corpmaputo-all-stop.sh

echo "Corp Lisboa"
./corplisboa/corplisboa-all-stop.sh

echo "Corp Brasilia"
./corpbrasilia/corpbrasilia-all-stop.sh

echo "Corp Trading"
./corptrading/corptrading-all-stop.sh

echo "TLS Control"
./tlsrcontrol/tlsrcontrol-stop.sh

echo "Sleep 4 seconds"
sleep 4

# echo "Force shutdown"
# docker rm --force $(docker ps -a --filter "name=ocean")
# docker container stop $(docker container ls -aq)
# docker container rm $(docker container ls -aq)

echo "List Docker containers"
docker ps -a
