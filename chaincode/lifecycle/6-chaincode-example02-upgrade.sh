#!/bin/bash
# ----------
# SPDX-License-Identifier: Apache-2.0
# ----------
#

# Load Env Vars
#----------------------------------------------------------------
./0-chaincode-env-vars.sh


# Invoke instantiated chaincode 
#----------------------------------------------------------------
peer chaincode upgrade -o $ORDERERNAME -C $CHANNELNAME -v $CHCODEVERSION -n $CHCODENAME \
    -c '{"Args":["init","a","150","b","350"]}' --peerAddresses $CORE_PEER_ADDRESS \
    --tls --cafile $CORE_PEER_TLS_ROOTCERT_FILE --tlsRootCertFiles $CORE_PEER_TLS_ROOTCERT_FILE


# List instantiated chaincode 
#----------------------------------------------------------------
peer chaincode list --instantiated -C $CHANNELNAME

