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
PEER="peer0-anchova.blockchain.biz:7034"

# peer0-anchova.blockchain.biz:7034
# peer1-anchova.blockchain.biz:7144
#
# peer0-badejo.blockchain.biz:7044
# peer1-badejo.blockchain.biz:7144

# List instantiated chaincodes 
#--------------------------------------------------------------------------------
peer chaincode list --instantiated -C $CHANNELNAME

# Invoke instantiated chaincode 
#--------------------------------------------------------------------------------
echo "Invoke sending 20 token from a -> b"

peer chaincode invoke -o $ORDERERNAME -C $CHANNELNAME -n $CHCODENAME  \
    -c '{"Args":["invoke","a","b","20"]}' \
    --peerAddresses $PEER \
    --tls --cafile $CORE_PEER_TLS_ROOTCERT_FILE --tlsRootCertFiles $CORE_PEER_TLS_ROOTCERT_FILE
    

# Query chaincodes 
#--------------------------------------------------------------------------------
echo -n "query A = "

peer chaincode query -C $CHANNELNAME -n $CHCODENAME  -c '{"Args":["query","a"]}'

#--------------------------------------------------------------------------------
echo -n "query B = "

peer chaincode query -C $CHANNELNAME -n $CHCODENAME  -c '{"Args":["query","b"]}'
