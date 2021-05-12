#!/bin/bash
# ----------
# SPDX-License-Identifier: Apache-2.0
# ----------
#
echo "- - - - - - - - -"
echo "Verify: ca.tlsrcontrol.blockchain.biz:5001"

echo "-> healthz"
curl ca.tlsrcontrol.blockchain.biz:5001/healthz

# echo "-> logspec"
# curl ca.tlsrcontrol.blockchain.biz:5001/logspec

# echo "-> metrics"
# curl ca.tlsrcontrol.blockchain.biz:5001/metrics

echo "- - - - - - - - -"