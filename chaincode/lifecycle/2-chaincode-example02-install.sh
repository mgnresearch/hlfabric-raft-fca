#!/bin/bash
# ----------
# SPDX-License-Identifier: Apache-2.0
# ----------
#

# Load Env Vars
#----------------------------------------------------------------
./0-chaincode-env-vars.sh

# Install chaincode from package
#----------------------------------------------------------------
peer chaincode install ${CHCODEPACKDIR}/example02package-v${CHCODEVERSION}.cds -l node --tls --cafile $CORE_PEER_TLS_ROOTCERT_FILE


# Install chaincode from direct file
#----------------------------------------------------------------
# peer chaincode install -n $CHCODENAME -p $CHCODEPATH -v $CHCODEVERSION -l node --tls --cafile $CORE_PEER_TLS_ROOTCERT_FILE


# List installed chaincodes 
#--------------------------------------------------------------------------------
peer chaincode list --installed -C $CHANNELNAME
