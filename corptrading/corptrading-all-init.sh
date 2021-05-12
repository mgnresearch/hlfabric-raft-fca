#!/bin/bash
# ----------
# SPDX-License-Identifier: Apache-2.0
# ----------
#
docker-compose -f ./docker-compose-corptrading.yaml up -d

sleep 3

docker ps -a
