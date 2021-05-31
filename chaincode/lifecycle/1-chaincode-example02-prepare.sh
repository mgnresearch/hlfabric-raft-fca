#!/bin/bash
# ----------
# SPDX-License-Identifier: Apache-2.0
# ----------
#

# Load Env Vars
#----------------------------------------------------------------
./0-chaincode-env-vars.sh


# Prepare chaincode pachage to install
#----------------------------------------------------------------
peer chaincode package -l node -n $CHCODENAME -p $CHCODEPATH -v $CHCODEVERSION -s -S ${CHCODEPACKDIR}/example02package-v${CHCODEVERSION}.cds

