#!/bin/bash
# ----------
# SPDX-License-Identifier: Apache-2.0
# ----------
#

# Load Env Vars
#----------------------------------------------------------------
./0-chaincode-env-vars.sh

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
    -c '{"Args":["invoke","a","b","20"]}' --peerAddresses $CORE_PEER_ADDRESS \
    --tls --cafile $CORE_PEER_TLS_ROOTCERT_FILE --tlsRootCertFiles $CORE_PEER_TLS_ROOTCERT_FILE
    

echo "Invoke sending 15 token from b -> a"

peer chaincode invoke -o $ORDERERNAME -C $CHANNELNAME -n $CHCODENAME  \
    -c '{"Args":["invoke","b","a","15"]}' --peerAddresses $CORE_PEER_ADDRESS \
    --tls --cafile $CORE_PEER_TLS_ROOTCERT_FILE --tlsRootCertFiles $CORE_PEER_TLS_ROOTCERT_FILE

# Registering transaction of querying
#----------------------------------------------------------------
echo -n "query A = "

peer chaincode invoke -o $ORDERERNAME -C $CHANNELNAME -n $CHCODENAME  \
    -c '{"Args":["query","a"]}' --peerAddresses $CORE_PEER_ADDRESS \
    --tls --cafile $CORE_PEER_TLS_ROOTCERT_FILE --tlsRootCertFiles $CORE_PEER_TLS_ROOTCERT_FILE
    
#----------------------------------------------------------------
echo -n "query B = "

peer chaincode invoke -o $ORDERERNAME -C $CHANNELNAME -n $CHCODENAME  \
    -c '{"Args":["query","b"]}' --peerAddresses $CORE_PEER_ADDRESS \
    --tls --cafile $CORE_PEER_TLS_ROOTCERT_FILE --tlsRootCertFiles $CORE_PEER_TLS_ROOTCERT_FILE

