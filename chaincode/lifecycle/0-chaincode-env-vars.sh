#!/bin/bash
# ----------
# SPDX-License-Identifier: Apache-2.0
# ----------
#

# Chaincode for Test related properties
# https://hyperledger-fabric.readthedocs.io/en/release-1.4/build_network.html

export CHANNELNAME="devchannel"
export ORDERERNAME="orderer0.trading.blockchain.biz:7050"
export CHCODEVERSION="1.0.0"
export CHCODENAME="example02mode"
export CHCODEPATH="/etc/hyperledger/chaincode/sample"
export CHCODEPACKDIR="/etc/hyperledger/chaincode/inpackage"

# Who Am I ?
#--------------------------------------------------------------------------------
echo 'CORE_PEER_ADDRESS: ' $CORE_PEER_ADDRESS
echo 'CORE_PEER_FILESYSTEMPATH: ' $CORE_PEER_FILESYSTEMPATH

# Checking Env Vars
#--------------------------------------------------------------------------------
echo 'CHANNELNAME: ' $CHANNELNAME
echo 'ORDERERNAME: ' $ORDERERNAME
echo 'CHCODEVERSION: ' $CHCODEVERSION
echo 'CHCODENAME: ' $CHCODENAME
echo 'CHCODEPATH: ' $CHCODEPATH
echo 'CHCODEPACKDIR: ' $CHCODEPACKDIR
