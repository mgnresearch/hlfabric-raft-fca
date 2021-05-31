#!/bin/bash
# ----------
# SPDX-License-Identifier: Apache-2.0
# ----------
#
export PROFILEGENESIS=MultiOrgOrdererEtcdRaft
export CHANNELNAME=syschannel

export FABRIC_CFG_PATH=$PWD

echo "Remove old Gen block"
rm -f ../config/genesis.block

echo "Generate genesis block for system running on Orderer"

configtxgen -profile $PROFILEGENESIS -channelID $CHANNELNAME -outputBlock ../config/genesis.block
