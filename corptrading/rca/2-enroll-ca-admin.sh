#!/bin/bash
# ----------
# SPDX-License-Identifier: Apache-2.0
# ----------
#

export FABRIC_CA_CLIENT_HOME=$PWD
export FABRIC_CA_CLIENT_TLS_CERTFILES=./client/tls-ca/rca-corptrading-tls-cert.pem
cat $FABRIC_CA_CLIENT_TLS_CERTFILES

echo "Enroll: Admin"
fabric-ca-client enroll -d -u https://rca-admin:rca-pwd@rca.corptrading.blockchain.biz:6005 --mspdir users/rca-admin/msp

# Adapt the "_sk" file
sleep 2
cp ./users/rca-admin/msp/keystore/*_sk ./users/rca-admin/msp/keystore/key.pem

echo "User listing at CA"
fabric-ca-client identity list --mspdir users/rca-admin/msp