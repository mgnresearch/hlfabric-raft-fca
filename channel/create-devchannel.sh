#!/bin/bash
# ----------
# SPDX-License-Identifier: Apache-2.0
# ----------
#

# These commands must be executed inside the CLI tools container of an organization chosen as the main one

# Who Am I ?
#--------------------------------------------------------------------------------
echo $CORE_PEER_ADDRESS
echo $CORE_PEER_FILESYSTEMPATH

# Check peer version
#--------------------------------------------------------------------------------
peer version

# Configure Env vars
#--------------------------------------------------------------------------------
export ORDERERNAME="orderer0.trading.blockchain.biz:7050"
export CHANNELNAME="devchannel"
export CONFIGTXGENSDEF="/etc/hyperledger/config/devchanneltrack.tx"

# List of channels peer has joined
#--------------------------------------------------------------------------------
peer channel list

# Sign the channel TX file
#--------------------------------------------------------------------------------
peer channel signconfigtx -f $CONFIGTXGENSDEF

# Create a channel 
# The result is a block file at ${CORE_PEER_FILESYSTEMPATH}/${CHANNELNAME}_genesis.block
# And we have to use this CHANNELGENSBLOCK as parameter to execute peer channel join
#--------------------------------------------------------------------------------
peer channel create -o $ORDERERNAME -c $CHANNELNAME -f $CONFIGTXGENSDEF --outputBlock ${CORE_PEER_FILESYSTEMPATH}/${CHANNELNAME}_genesis.block --tls --cafile=$CORE_PEER_TLS_ROOTCERT_FILE

# Get information of a specified channel.
#--------------------------------------------------------------------------------
peer channel getinfo -o $ORDERERNAME -c $CHANNELNAME --tls --cafile=$CORE_PEER_TLS_ROOTCERT_FILE

# END
