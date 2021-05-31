#!/bin/bash
# ----------
# SPDX-License-Identifier: Apache-2.0
# ----------
#

export DOMAIN=coffee.blockchain.biz

echo "- - - - - - - - -"
echo "Verify: *."${DOMAIN}

echo "rca."${DOMAIN}" -> healthz"
curl rca.${DOMAIN}:7045/healthz
echo " "

# echo "rca."${DOMAIN}" -> logspec"
# curl rca.${DOMAIN}:7045/logspec

# echo "rca."${DOMAIN}" -> metrics"
# curl rca.${DOMAIN}:7045/metrics

echo "peer0."${DOMAIN}" -> healthz"
curl peer0.${DOMAIN}:7145/healthz
echo " "

echo "peer1."${DOMAIN}" -> healthz"
curl peer1.${DOMAIN}:7245/healthz
echo " "

echo " "
