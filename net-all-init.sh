#!/bin/bash
# ----------
# SPDX-License-Identifier: Apache-2.0
# ----------
#
echo "Blockchain network take-off..."

echo "TLS Control"
./tlsrcontrol/tlsrcontrol-init.sh

echo "Corp Trading"
./corptrading/corptrading-all-init.sh

echo "Corp Brasilia"
./corpbrasilia/corpbrasilia-all-init.sh

echo "Corp Lisboa"
./corplisboa/corplisboa-all-init.sh

echo "Corp Maputo"
./corpmaputo/corpmaputo-all-init.sh

echo "Sleep 2 seconds"
sleep 2

echo "List Docker containers"
docker ps -a
