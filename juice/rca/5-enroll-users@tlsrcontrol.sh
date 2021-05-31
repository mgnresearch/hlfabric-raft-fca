#!/bin/bash
# ----------
# SPDX-License-Identifier: Apache-2.0
# ----------
#

cp ../../tlsring/rca/client/tls-ca/rca-tlsring-tls-cert.pem ./client/tls-ca/

export FABRIC_CA_CLIENT_HOME=$PWD
export FABRIC_CA_CLIENT_TLS_CERTFILES=./client/tls-ca/rca-tlsring-tls-cert.pem
cat $FABRIC_CA_CLIENT_TLS_CERTFILES
export TLSR_SERVER=rca.tlsring.blockchain.biz:5005

# -------------------------------------------------------------------

echo "Juice User @ TLS"
fabric-ca-client enroll -u https://user1-juice:user1-pwd@${TLSR_SERVER} --mspdir users/user1/tls-msp --enrollment.profile tls
# Adapt the "_sk" file
sleep 1
cp ./users/user1/tls-msp/keystore/*_sk ./users/user1/tls-msp/keystore/key.pem

echo "Juice Peers @ TLS"
fabric-ca-client enroll -u https://peer0-juice:peer0-pwd@${TLSR_SERVER} --mspdir users/peer0/tls-msp --enrollment.profile tls --csr.hosts peer0.juice.blockchain.biz
# Adapt the "_sk" file
sleep 1
cp ./users/peer0/tls-msp/keystore/*_sk ./users/peer0/tls-msp/keystore/key.pem

fabric-ca-client enroll -u https://peer1-juice:peer1-pwd@${TLSR_SERVER} --mspdir users/peer1/tls-msp --enrollment.profile tls --csr.hosts peer1.juice.blockchain.biz
# Adapt the "_sk" file
sleep 1
cp ./users/peer1/tls-msp/keystore/*_sk ./users/peer1/tls-msp/keystore/key.pem

echo " "
echo "END"
