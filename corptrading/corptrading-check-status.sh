#!/bin/bash
# ----------
# SPDX-License-Identifier: Apache-2.0
# ----------
#
echo "- - - - - - - - -"
echo "Verify: *.corptrading.blockchain.biz"

# echo "rca.corptrading -> logspec"
# curl rca.corptrading.blockchain.biz:6045/logspec

# echo "rca.corptrading -> metrics"
# curl rca.corptrading.blockchain.biz:6045/metrics

echo "rca.corptrading -> healthz"
curl rca.corptrading.blockchain.biz:6045/healthz
echo " "

echo "orderer1.corptrading -> healthz"
curl orderer1.corptrading.blockchain.biz:6145/healthz
echo " "

echo "orderer2.corptrading -> healthz"
curl orderer2.corptrading.blockchain.biz:6245/healthz
echo " "

# echo "orderer3.corptrading -> healthz"
# curl orderer3.corptrading.blockchain.biz:6345/healthz
# echo " "

# echo "orderer4.corptrading -> healthz"
# curl orderer4.corptrading.blockchain.biz:6445/healthz
# echo " "

echo "- - - - - - - - -"
