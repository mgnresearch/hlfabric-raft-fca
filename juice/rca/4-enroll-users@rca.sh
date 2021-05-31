#!/bin/bash
# ----------
# SPDX-License-Identifier: Apache-2.0
# ----------
#

export FABRIC_CA_CLIENT_HOME=$PWD
export FABRIC_CA_CLIENT_TLS_CERTFILES=./client/tls-ca/rca-juice-tls-cert.pem
cat $FABRIC_CA_CLIENT_TLS_CERTFILES
export RCA_SERVER=rca.juice.blockchain.biz:8005

echo "Listar usuarios na CA"
fabric-ca-client identity list --mspdir users/rca-admin/msp

echo "Juice Admin @ RCA"
fabric-ca-client enroll -u https://admin-juice:admin-pwd@${RCA_SERVER} --mspdir users/admin/msp
# Adapt the "_sk" file
sleep 1
cp ./users/admin/msp/keystore/*_sk ./users/admin/msp/keystore/key.pem

echo "Juice User @ RCA"
fabric-ca-client enroll -u https://user1-juice:user1-pwd@${RCA_SERVER} --mspdir users/user1/msp
# Adapt the "_sk" file
sleep 1
cp ./users/user1/msp/keystore/*_sk ./users/user1/msp/keystore/key.pem

echo "Juice Peers @ RCA"
fabric-ca-client enroll -u https://peer0-juice:peer0-pwd@${RCA_SERVER} --mspdir users/peer0/msp
# Adapt the "_sk" file
sleep 1
cp ./users/peer0/msp/keystore/*_sk ./users/peer0/msp/keystore/key.pem

fabric-ca-client enroll -u https://peer1-juice:peer1-pwd@${RCA_SERVER} --mspdir users/peer1/msp
# Adapt the "_sk" file
sleep 1
cp ./users/peer1/msp/keystore/*_sk ./users/peer1/msp/keystore/key.pem

echo " "
echo "END"
