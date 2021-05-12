#!/bin/bash
# ----------
# SPDX-License-Identifier: Apache-2.0
# ----------
#
export PROFILEGENESIS=MultiOrgOrdererEtcdRaft
export CHANNELNAME=syschannel

export FABRIC_CFG_PATH=$PWD

echo "Remove old Gen block"
rm -f ./genesis.block

echo "Generate genesis block for system running on Orderer"
# configtxgen -configPath ./configtx.yaml -profile $PROFILEGENESIS -channelID $CHANNELNAME -outputBlock ./genesis.block

configtxgen -profile $PROFILEGENESIS -channelID $CHANNELNAME -outputBlock ./genesis.block
