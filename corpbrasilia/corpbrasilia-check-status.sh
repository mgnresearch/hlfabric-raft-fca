#!/bin/bash
# ----------
# SPDX-License-Identifier: Apache-2.0
# ----------
#
echo "- - - - - - - - -"
echo "Verify: *-corpbrasilia.blockchain.biz"

echo "rca.corpbrasilia.blockchain.biz -> healthz"
curl rca.corpbrasilia.blockchain.biz:7045/healthz
echo " "

# echo "rca.corpbrasilia.blockchain.biz -> logspec"
# curl rca.corpbrasilia.blockchain.biz:7045/logspec

# echo "rca.corpbrasilia.blockchain.biz -> metrics"
# curl rca.corpbrasilia.blockchain.biz:7045/metrics

echo "peer1.corpbrasilia.blockchain.biz -> healthz"
curl peer1.corpbrasilia.blockchain.biz:7145/healthz
echo " "

echo "peer2.corpbrasilia.blockchain.biz -> healthz"
curl peer2.corpbrasilia.blockchain.biz:7245/healthz
echo " "

echo "- - - - - - - - -"
