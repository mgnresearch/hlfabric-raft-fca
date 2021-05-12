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

# List installed chaincodes 
#--------------------------------------------------------------------------------
peer chaincode list --installed -C $CHANNELNAME


# Instantiate chaincode 
# https://hyperledger-fabric.readthedocs.io/en/release-1.4/endorsement-policies.html
#--------------------------------------------------------------------------------
peer chaincode instantiate -C $CHANNELNAME -n $CHCODENAME -v $CHCODEVERSION -o $ORDERERNAME \
    -c '{"Args":["init","a","150","b","350"]}' \
    -P "OR('SeaMSP.admin','AnchovaMSP.admin','AnchovaMSP.peer','AnchovaMSP.member','BadejoMSP.admin','BadejoMSP.peer','BadejoMSP.member')" \
    --tls --cafile $CORE_PEER_TLS_ROOTCERT_FILE


# List instantiated chaincodes 
#--------------------------------------------------------------------------------
peer chaincode list --instantiated -C $CHANNELNAME
