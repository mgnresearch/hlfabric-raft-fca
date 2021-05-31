#!/bin/bash
# ----------
# SPDX-License-Identifier: Apache-2.0
# ----------
#

export FABRIC_CA_CLIENT_HOME=$PWD
export FABRIC_CA_CLIENT_TLS_CERTFILES=./client/tls-ca/rca-tlsring-tls-cert.pem
cat $FABRIC_CA_CLIENT_TLS_CERTFILES
export TLSR_SERVER=rca.tlsring.blockchain.biz:5005

echo "Enroll: Admin"
fabric-ca-client enroll -d -u https://tlsr-admin:tlsr-pwd@${TLSR_SERVER} --mspdir users/tlsr-admin/msp

# Adapt the "_sk" file
cp ./users/tlsr-admin/msp/keystore/*_sk ./users/tlsr-admin/msp/keystore/key.pem

echo "User listing at CA"
fabric-ca-client identity list --mspdir users/tlsr-admin/msp
