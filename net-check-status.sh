#!/bin/bash
# ----------
# SPDX-License-Identifier: Apache-2.0
# ----------
#

echo "Trading Orderer"
./trading/ordering-check-status.sh

echo "Coffee"
./coffee/srv-check-status.sh

echo "Juice"
./juice/srv-check-status.sh

echo " "
echo "END"
