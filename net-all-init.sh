#!/bin/bash
# ----------
# SPDX-License-Identifier: Apache-2.0
# ----------
#
echo "Blockchain network take-off..."

docker-compose -f ./docker-compose.yaml up -d

echo "Sleep 2 seconds"
sleep 2

echo "List Docker containers"
docker ps -a
