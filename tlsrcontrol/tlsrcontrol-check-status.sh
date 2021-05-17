#!/bin/bash
# ----------
# SPDX-License-Identifier: Apache-2.0
# ----------
#
echo "- - - - - - - - -"
echo "Verify: ca.tlsrcontrol.blockchain.biz:5045"

echo "-> healthz"
curl ca.tlsrcontrol.blockchain.biz:5045/healthz

# echo "-> logspec"
# curl ca.tlsrcontrol.blockchain.biz:5045/logspec

# echo "-> metrics"
# curl ca.tlsrcontrol.blockchain.biz:5045/metrics

echo "- - - - - - - - -"