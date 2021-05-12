#!/bin/bash
# ----------
# SPDX-License-Identifier: Apache-2.0
# ----------
#
echo "- - - - - - - - -"
echo "Verify: *.corpmaputo.blockchain.biz"

# echo "rca.corpmaputo.blockchain.biz -> logspec"
# curl rca.corpmaputo.blockchain.biz:9045/logspec

# echo "rca.corpmaputo.blockchain.biz -> metrics"
# curl rca.corpmaputo.blockchain.biz:9045/metrics

echo "rca.corpmaputo.blockchain.biz -> healthz"
curl rca.corpmaputo.blockchain.biz:9045/healthz
echo " "

echo "peer1.corpmaputo.blockchain.biz -> healthz"
curl peer1.corpmaputo.blockchain.biz:9145/healthz
echo " "

echo "peer2.corpmaputo.blockchain.biz -> healthz"
curl peer2.corpmaputo.blockchain.biz:9245/healthz
echo " "

echo "- - - - - - - - -"
