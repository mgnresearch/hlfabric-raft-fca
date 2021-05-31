#!/bin/bash
# ----------
# SPDX-License-Identifier: Apache-2.0
# ----------
#

export DOMAIN=juice.blockchain.biz

echo "- - - - - - - - -"
echo "Verify: *."${DOMAIN}

echo "rca."${DOMAIN}" -> healthz"
curl rca.${DOMAIN}:8045/healthz
echo " "

# echo "rca."${DOMAIN}" -> logspec"
# curl rca.${DOMAIN}:8045/logspec

# echo "rca."${DOMAIN}" -> metrics"
# curl rca.${DOMAIN}:8045/metrics

echo "peer0."${DOMAIN}" -> healthz"
curl peer0.${DOMAIN}:8145/healthz
echo " "

echo "peer1."${DOMAIN}" -> healthz"
curl peer1.${DOMAIN}:8245/healthz
echo " "

echo " "
