#!/bin/bash
# ----------
# SPDX-License-Identifier: Apache-2.0
# ----------
#

export DOMAIN=trading.blockchain.biz

echo "- - - - - - - - -"
echo "Verify: *."${DOMAIN}

echo "rca."${DOMAIN}" -> healthz"
curl rca.${DOMAIN}:7051/healthz
echo " "

# echo "rca."${DOMAIN}" -> logspec"
# curl rca.${DOMAIN}:7051/logspec

# echo "rca."${DOMAIN}" -> metrics"
# curl rca.${DOMAIN}:7051/metrics

echo "orderer0."${DOMAIN}" -> healthz"
curl orderer0.${DOMAIN}:6145/healthz
echo " "

echo "orderer1."${DOMAIN}" -> healthz"
curl orderer1.${DOMAIN}:6245/healthz
echo " "

echo "orderer2."${DOMAIN}" -> healthz"
curl orderer2.${DOMAIN}:6345/healthz
echo " "

echo " "
