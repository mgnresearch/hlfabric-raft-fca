#!/bin/bash
# ----------
# SPDX-License-Identifier: Apache-2.0
# ----------
#

# Estes comandos devem ser executados dentro do contaner CLI tools

# Who Am I ?
#--------------------------------------------------------------------------------
echo $CORE_PEER_ADDRESS

# Configure Env vars
#--------------------------------------------------------------------------------
export ORDERERNAME="orderer1.corptrading.blockchain.biz:6132"
export CHANNELNAME="devchannel"
export CHANNELGENSBLOCK="/etc/hyperledger/configtx/devchannelgen.block"

# Joins the Guarani peer to channel
# Reference: https://medium.com/@kctheservant/transactions-in-hyperledger-fabric-50e068dda8a9
#--------------------------------------------------------------------------------
peer channel join -o $ORDERERNAME -b $CHANNELGENSBLOCK --tls --cafile=$CORE_PEER_TLS_ROOTCERT_FILE

# Get information of a specified channel.
#--------------------------------------------------------------------------------
peer channel getinfo -o $ORDERERNAME -c $CHANNELNAME --tls --cafile=$CORE_PEER_TLS_ROOTCERT_FILE

# List of channels peer has joined
#--------------------------------------------------------------------------------
peer channel list

# END