#!/bin/bash
# ----------
# SPDX-License-Identifier: Apache-2.0
# ----------
#

# Chaincode for Test related properties
# https://hyperledger-fabric.readthedocs.io/en/release-1.4/build_network.html

CHANNELNAME="devchannel"
ORDERERNAME="orderer-sea.blockchain.biz:7050"
CHCODEVERSION="1.0.0"
CHCODENAME="example02"
CHCODEPATH="/etc/hyperledger/chaincode/sample"

#--------------------------------------------------------------------------------
# Prepare chaincode pachage to install
#--------------------------------------------------------------------------------
peer chaincode package -l node -n $CHCODENAME -p $CHCODEPATH -v $CHCODEVERSION \
    -s -S /etc/hyperledger/chaincode/inpackage/example02package-v1.0.0.cds

# Install chaincode from package
#--------------------------------------------------------------------------------
peer chaincode install /etc/hyperledger/chaincode/inpackage/example02package-v1.0.0.cds -l node \
    --tls --cafile $CORE_PEER_TLS_ROOTCERT_FILE


# Install chaincode from direct file
#--------------------------------------------------------------------------------
# peer chaincode install -n $CHCODENAME -p $CHCODEPATH -v $CHCODEVERSION -l node --tls --cafile $CORE_PEER_TLS_ROOTCERT_FILE


# List installed chaincodes 
#--------------------------------------------------------------------------------
peer chaincode list --installed -C $CHANNELNAME
