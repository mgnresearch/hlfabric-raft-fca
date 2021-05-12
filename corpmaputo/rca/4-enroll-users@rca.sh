#!/bin/bash
# ----------
# SPDX-License-Identifier: Apache-2.0
# ----------
#

export FABRIC_CA_CLIENT_HOME=$PWD
export FABRIC_CA_CLIENT_TLS_CERTFILES=./client/tls-ca/rca-corpmaputo-tls-cert.pem
cat $FABRIC_CA_CLIENT_TLS_CERTFILES

echo "Listar usuarios na CA"
fabric-ca-client identity list --mspdir users/rca-admin/msp

echo "CorpMaputo Peers @ RCA"
fabric-ca-client enroll -u https://peer1-corpmaputo:peer1-pwd@rca.corpmaputo.blockchain.biz:9005 --mspdir users/peer1/msp
# Adapt the "_sk" file
sleep 2
cp ./users/peer1/msp/keystore/*_sk ./users/peer1/msp/keystore/key.pem

fabric-ca-client enroll -u https://peer2-corpmaputo:peer2-pwd@rca.corpmaputo.blockchain.biz:9005 --mspdir users/peer2/msp
# Adapt the "_sk" file
sleep 2
cp ./users/peer2/msp/keystore/*_sk ./users/peer2/msp/keystore/key.pem

echo "CorpMaputo Admin @ RCA"
fabric-ca-client enroll -u https://admin-corpmaputo:admin-pwd@rca.corpmaputo.blockchain.biz:9005 --mspdir users/admin/msp
# Adapt the "_sk" file
sleep 2
cp ./users/admin/msp/keystore/*_sk ./users/admin/msp/keystore/key.pem

echo "CorpMaputo User @ RCA"
fabric-ca-client enroll -u https://user1-corpmaputo:user1-pwd@rca.corpmaputo.blockchain.biz:9005 --mspdir users/user1/msp
# Adapt the "_sk" file
sleep 2
cp ./users/user1/msp/keystore/*_sk ./users/user1/msp/keystore/key.pem

echo "CorpMaputo Orderer @ RCA"
fabric-ca-client enroll -u https://orderer1-corpmaputo:orderer1-pwd@rca.corpmaputo.blockchain.biz:9005 --mspdir users/orderer1/msp
# Adapt the "_sk" file
sleep 2
cp ./users/orderer1/msp/keystore/*_sk ./users/orderer1/msp/keystore/key.pem
