#!/bin/bash
# ----------
# SPDX-License-Identifier: Apache-2.0
# ----------
#
docker-compose -f ./docker-compose-corpbrasilia.yaml down

sleep 2

docker ps -a