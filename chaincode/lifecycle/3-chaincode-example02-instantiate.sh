#!/bin/bash
# ----------
# SPDX-License-Identifier: Apache-2.0
# ----------
#

# Load Env Vars
#----------------------------------------------------------------
./0-chaincode-env-vars.sh


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
    -c '{"Args":["init","a","350","b","750"]}' \
    -P "OR('Trading.admin','Trading.member','Trading.client','CoffeeMSP.admin','CoffeeMSP.member','CoffeeMSP.client','JuiceMSP.admin','JuiceMSP.member','JuiceMSP.client')" \
    --tls --cafile $CORE_PEER_TLS_ROOTCERT_FILE --tlsRootCertFiles $CORE_PEER_TLS_ROOTCERT_FILE


# List instantiated chaincodes 
#----------------------------------------------------------------
peer chaincode list --instantiated -C $CHANNELNAME
