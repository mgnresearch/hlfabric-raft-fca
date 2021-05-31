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


# Query Health Check 
#----------------------------------------------------------------
peer chaincode query -C $CHANNELNAME -n $CHCODENAME -c '{"Args":["health","a"]}' --tls --cafile $CORE_PEER_TLS_ROOTCERT_FILE


# Query chaincodes 
#----------------------------------------------------------------
echo -n "query A = "

peer chaincode query -C $CHANNELNAME -n $CHCODENAME -c '{"Args":["query","a"]}' --tls --cafile $CORE_PEER_TLS_ROOTCERT_FILE

#----------------------------------------------------------------
echo -n "query B = "

peer chaincode query -C $CHANNELNAME -n $CHCODENAME -c '{"Args":["query","b"]}' --tls --cafile $CORE_PEER_TLS_ROOTCERT_FILE
