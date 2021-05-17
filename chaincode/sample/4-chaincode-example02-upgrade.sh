#!/bin/bash
# ----------
# SPDX-License-Identifier: Apache-2.0
# ----------
#

# Chaincode for Test related properties
# https://hyperledger-fabric.readthedocs.io/en/release-1.4/build_network.html

CHANNELNAME="devchannel"
ORDERERNAME="orderer1.corptrading.blockchain.biz:6130"
CHCODEVERSION="1.0.1"
CHCODENAME="example02"
CHCODEPATH="/etc/hyperledger/chaincode/sample"
PEER_ADDRESS="peer1.corpbrasilia.blockchain.biz:7134"

# Invoke instantiated chaincode 
#----------------------------------------------------------------
peer chaincode upgrade -o $ORDERERNAME -C $CHANNELNAME -v $CHCODEVERSION -n CHCODENAME \
    -c '{"Args":["invoke","a","b","20"]}' --peerAddresses $$PEER_ADDRESS \
    --tls --cafile $CORE_PEER_TLS_ROOTCERT_FILE --tlsRootCertFiles $CORE_PEER_TLS_ROOTCERT_FILE


# List instantiated chaincode 
#----------------------------------------------------------------
peer chaincode list --instantiated -C CHANNELNAME

