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

# List instantiated chaincodes 
#----------------------------------------------------------------
peer chaincode list --instantiated -C $CHANNELNAME

# Get channel information 
#----------------------------------------------------------------
peer channel getinfo -o $ORDERERNAME -c $CHANNELNAME --tls --cafile $CORE_PEER_TLS_ROOTCERT_FILE

# Invoke instantiated chaincode 
#----------------------------------------------------------------
echo "Invoke sending 20 token from a -> b"

peer chaincode invoke -o $ORDERERNAME -C $CHANNELNAME -n $CHCODENAME  \
    -c '{"Args":["invoke","a","b","20"]}' \
    --peerAddresses $PEER_ADDRESS \
    --tls --cafile $CORE_PEER_TLS_ROOTCERT_FILE --tlsRootCertFiles $CORE_PEER_TLS_ROOTCERT_FILE
    

# Registering transaction of querying
#----------------------------------------------------------------
echo -n "query A = "

peer chaincode invoke -o $ORDERERNAME -C $CHANNELNAME -n $CHCODENAME  \
    -c '{"Args":["query","a"]}' \
    --peerAddresses $PEER_ADDRESS \
    --tls --cafile $CORE_PEER_TLS_ROOTCERT_FILE --tlsRootCertFiles $CORE_PEER_TLS_ROOTCERT_FILE
    
#----------------------------------------------------------------
echo -n "query B = "

peer chaincode invoke -o $ORDERERNAME -C $CHANNELNAME -n $CHCODENAME  \
    -c '{"Args":["query","b"]}' \
    --peerAddresses $PEER_ADDRESS \
    --tls --cafile $CORE_PEER_TLS_ROOTCERT_FILE --tlsRootCertFiles $CORE_PEER_TLS_ROOTCERT_FILE

