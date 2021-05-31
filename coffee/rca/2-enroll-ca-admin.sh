#!/bin/bash
# ----------
# SPDX-License-Identifier: Apache-2.0
# ----------
#

export FABRIC_CA_CLIENT_HOME=$PWD
export FABRIC_CA_CLIENT_TLS_CERTFILES=./client/tls-ca/rca-coffee-tls-cert.pem
cat $FABRIC_CA_CLIENT_TLS_CERTFILES
export RCA_SERVER=rca.coffee.blockchain.biz:7005

echo "Enroll: Admin"
fabric-ca-client enroll -d -u https://rca-admin:rca-pwd@${RCA_SERVER} --mspdir users/rca-admin/msp

# Adapt the "_sk" file
sleep 1
cp ./users/rca-admin/msp/keystore/*_sk ./users/rca-admin/msp/keystore/key.pem

echo "User listing at CA"
fabric-ca-client identity list --mspdir users/rca-admin/msp

echo " "
echo "END"
