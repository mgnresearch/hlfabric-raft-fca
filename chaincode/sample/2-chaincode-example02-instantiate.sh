#!/bin/bash
# ----------
# SPDX-License-Identifier: Apache-2.0
# ----------
#

# Chaincode for Test related properties
# https://hyperledger-fabric.readthedocs.io/en/release-1.4/build_network.html

CHANNELNAME="devchannel"
ORDERERNAME="orderer1.corptrading.blockchain.biz:6130"
CHCODEVERSION="1.0.0"
CHCODENAME="example02"
CHCODEPATH="/etc/hyperledger/chaincode/sample"
PEER_ADDRESS="peer1.corpbrasilia.blockchain.biz:7134"

# List installed chaincodes 
#----------------------------------------------------------------
peer chaincode list --installed -C $CHANNELNAME

# Get channel information 
#----------------------------------------------------------------
peer channel getinfo -o $ORDERERNAME -c $CHANNELNAME --tls --cafile $CORE_PEER_TLS_ROOTCERT_FILE

# Instantiate chaincode 
# https://hyperledger-fabric.readthedocs.io/en/release-1.4/endorsement-policies.html
#----------------------------------------------------------------
peer chaincode instantiate -C $CHANNELNAME -n $CHCODENAME -v $CHCODEVERSION -o $ORDERERNAME \
    -c '{"Args":["init","a","150","b","350"]}' \
    -P "OR('CorpTradingMSP.admin','CorpTradingMSP.member','CorpTradingMSP.client','CorpBrasiliaMSP.admin','CorpBrasiliaMSP.member','CorpBrasiliaMSP.client','CorpLisboaMSP.admin','CorpLisboaMSP.member','CorpLisboaMSP.client')" \
    ---tls --cafile $CORE_PEER_TLS_ROOTCERT_FILE --tlsRootCertFiles $CORE_PEER_TLS_ROOTCERT_FILE


# List instantiated chaincodes 
#----------------------------------------------------------------
peer chaincode list --instantiated -C $CHANNELNAME
