#!/bin/bash
# ----------
# SPDX-License-Identifier: Apache-2.0
# ----------
#
docker-compose -f ./docker-compose.yaml up -d coffee.rca

sleep 2

docker ps -a

echo " "
echo "END"
