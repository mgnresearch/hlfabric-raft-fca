#!/bin/bash
# ----------
# SPDX-License-Identifier: Apache-2.0
# ----------
#

# These commands must be executed inside the CLI tools container of an organization chosen as the main one

# Check peer version
#--------------------------------------------------------------------------------
peer version

# Configure Env vars
#--------------------------------------------------------------------------------
export ORDERERNAME="orderer1.corptrading.blockchain.biz:6132"
export CHANNELNAME="devchannel"
export CONFIGTXGENSDEF="/etc/hyperledger/configtx/devchanneltrack.tx"
export CHANNELGENSBLOCK="/etc/hyperledger/configtx/devchannelgen.block"

# List of channels peer has joined
#--------------------------------------------------------------------------------
peer channel list

# Remove previous channel block
#--------------------------------------------------------------------------------
rm -f $CHANNELGENSBLOCK

# Sign the channel TX file
#--------------------------------------------------------------------------------
peer channel signconfigtx -f $CONFIGTXGENSDEF

# Create a channel 
# The result is a block file named CHANNELGENSBLOCK. 
# And we have to use this CHANNELGENSBLOCK as parameter to execute peer channel join
#--------------------------------------------------------------------------------
peer channel create -o $ORDERERNAME -c $CHANNELNAME -f $CONFIGTXGENSDEF --outputBlock $CHANNELGENSBLOCK --tls --cafile=$CORE_PEER_TLS_ROOTCERT_FILE


# END