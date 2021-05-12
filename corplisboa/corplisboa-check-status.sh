#!/bin/bash
# ----------
# SPDX-License-Identifier: Apache-2.0
# ----------
#
echo "- - - - - - - - -"
echo "Verify: *.corplisboa.blockchain.biz"

# echo "rca.corplisboa.blockchain.biz -> logspec"
# curl rca.corplisboa.blockchain.biz:8045/logspec

# echo "rca.corplisboa.blockchain.biz -> metrics"
# curl rca.corplisboa.blockchain.biz:8045/metrics

echo "rca.corplisboa.blockchain.biz -> healthz"
curl rca.corplisboa.blockchain.biz:8045/healthz
echo " "

echo "peer1.corplisboa.blockchain.biz -> healthz"
curl peer1.corplisboa.blockchain.biz:8145/healthz
echo " "

echo "peer2.corplisboa.blockchain.biz -> healthz"
curl peer2.corplisboa.blockchain.biz:8245/healthz
echo " "

echo "- - - - - - - - -"
