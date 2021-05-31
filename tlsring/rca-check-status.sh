#!/bin/bash
# ----------
# SPDX-License-Identifier: Apache-2.0
# ----------
#

export TLSR_SERVER=rca.tlsring.blockchain.biz:5045

echo "- - - - - - - - -"
echo "Verify: " ${TLSR_SERVER}

echo "-> healthz"
curl ${TLSR_SERVER}/healthz

# echo "-> logspec"
# curl ${TLSR_SERVER}/logspec

# echo "-> metrics"
# curl ${TLSR_SERVER}/metrics

echo " "
echo "- - - - - - - - -"