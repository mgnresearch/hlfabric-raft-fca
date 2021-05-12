#!/bin/bash
# ----------
# SPDX-License-Identifier: Apache-2.0
# ----------
#

export FABRIC_CA_CLIENT_HOME=$PWD
export FABRIC_CA_CLIENT_TLS_CERTFILES=./client/tls-ca/ca-tlsrcontrol-tls-cert.pem
cat $FABRIC_CA_CLIENT_TLS_CERTFILES

echo "Enroll: Admin"
fabric-ca-client enroll -d -u https://tlsr-admin:tlsr-pwd@ca.tlsrcontrol.blockchain.biz:5005 --mspdir users/tlsr-admin/msp

# Adapt the "_sk" file
cp ./users/tlsr-admin/msp/keystore/*_sk ./users/tlsr-admin/msp/keystore/key.pem

echo "User listing at CA"
fabric-ca-client identity list --mspdir users/tlsr-admin/msp
