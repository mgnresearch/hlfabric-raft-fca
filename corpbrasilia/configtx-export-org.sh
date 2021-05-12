#!/bin/bash
# ----------
# SPDX-License-Identifier: Apache-2.0
# ----------
#

export FABRIC_CFG_PATH=$PWD

export ORGANIZATION=CorpBrasiliaMSP

rm -f $ORGANIZATION.json

echo "Generate organization configuration"
# A existência do parâmetro "-configPath ./configtx.yaml" causa um erro na hora de executar:
#   - [common.tools.configtxgen] func1 -> PANI 003 Error reading configuration:  Unsupported Config Type ""
#
# configtxgen -configPath ./configtx.yaml -printOrg $ORGANIZATION
#

configtxgen -printOrg $ORGANIZATION > $ORGANIZATION.json
