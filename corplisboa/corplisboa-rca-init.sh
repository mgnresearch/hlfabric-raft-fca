#!/bin/bash
# ----------
# SPDX-License-Identifier: Apache-2.0
# ----------
#
docker-compose -f ./docker-compose-corplisboa.yaml up -d corplisboa.rca

sleep 3

docker ps -a
