#!/bin/bash
# ----------
# SPDX-License-Identifier: Apache-2.0
# ----------
#
export PROFILECHANNEL=MultiOrgChannel
export CHANNELNAME=devchannel

export FABRIC_CFG_PATH=$PWD

echo "Remove old Tx block"
rm -f ./${CHANNELNAME}track.tx

echo "Generate channel configuration transaction file"
configtxgen -profile $PROFILECHANNEL -channelID $CHANNELNAME -outputCreateChannelTx ./${CHANNELNAME}track.tx
