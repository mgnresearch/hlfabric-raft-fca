#!/bin/bash
# ----------
# SPDX-License-Identifier: Apache-2.0
# ----------
#

export FABRIC_CFG_PATH=$PWD

export ORGANIZATION=CorpMaputoMSP

rm -f $ORGANIZATION.json

echo "Generate organization configuration"
# The existence of the "-configPath ./configtx.yaml" parameter causes an error when executing :
#   - [common.tools.configtxgen] func1 -> PANI 003 Error reading configuration:  Unsupported Config Type ""
#
# configtxgen -configPath ./configtx.yaml -printOrg $ORGANIZATION
#

configtxgen -printOrg $ORGANIZATION > $ORGANIZATION.json
