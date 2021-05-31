#!/bin/bash
# ----------
# SPDX-License-Identifier: Apache-2.0
# ----------
#

# These commands must be executed within the CLI tools container

# Who Am I ?
#--------------------------------------------------------------------------------
echo $CORE_PEER_ADDRESS
echo $CORE_PEER_FILESYSTEMPATH

# Configure Env Vars
#--------------------------------------------------------------------------------
export ORDERERNAME="orderer0.trading.blockchain.biz:7050"
export CHANNELNAME="devchannel"

# Remove previous channel oldest block
#--------------------------------------------------------------------------------
ls ${CORE_PEER_FILESYSTEMPATH}/${CHANNELNAME}_oldest.block
rm -f ${CORE_PEER_FILESYSTEMPATH}/${CHANNELNAME}_oldest.block

# Fetch the genesis block from channel, and save at CORE_PEER_FILESYSTEMPATH folder
# The result is a block file at ${CORE_PEER_FILESYSTEMPATH}/${CHANNELNAME}_oldest.block
# And we have to use this ${CORE_PEER_FILESYSTEMPATH}/${CHANNELNAME}_oldest.block as parameter to execute 'peer channel join'
#--------------------------------------------------------------------------------
peer channel fetch oldest ${CORE_PEER_FILESYSTEMPATH}/${CHANNELNAME}_oldest.block -o $ORDERERNAME -c $CHANNELNAME --tls --cafile=$CORE_PEER_TLS_ROOTCERT_FILE

# Joins the peer to channel
# Reference: https://medium.com/@kctheservant/transactions-in-hyperledger-fabric-50e068dda8a9
#--------------------------------------------------------------------------------
peer channel join -o $ORDERERNAME -b ${CORE_PEER_FILESYSTEMPATH}/${CHANNELNAME}_oldest.block --tls --cafile=$CORE_PEER_TLS_ROOTCERT_FILE

# Get information of a specified channel.
#--------------------------------------------------------------------------------
peer channel getinfo -o $ORDERERNAME -c $CHANNELNAME --tls --cafile=$CORE_PEER_TLS_ROOTCERT_FILE

# List of channels peer has joined
#--------------------------------------------------------------------------------
peer channel list

# END
