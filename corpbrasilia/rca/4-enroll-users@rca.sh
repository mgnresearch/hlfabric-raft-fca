#!/bin/bash
# ----------
# SPDX-License-Identifier: Apache-2.0
# ----------
#

export FABRIC_CA_CLIENT_HOME=$PWD
export FABRIC_CA_CLIENT_TLS_CERTFILES=./client/tls-ca/rca-corpbrasilia-tls-cert.pem
cat $FABRIC_CA_CLIENT_TLS_CERTFILES

echo "Listar usuarios na CA"
fabric-ca-client identity list --mspdir users/rca-admin/msp

echo "CorpBrasilia Peers @ RCA"
fabric-ca-client enroll -u https://peer1-corpbrasilia:peer1-pwd@rca.corpbrasilia.blockchain.biz:7005 --mspdir users/peer1/msp
# Adapt the "_sk" file
sleep 2
cp ./users/peer1/msp/keystore/*_sk ./users/peer1/msp/keystore/key.pem

fabric-ca-client enroll -u https://peer2-corpbrasilia:peer2-pwd@rca.corpbrasilia.blockchain.biz:7005 --mspdir users/peer2/msp
# Adapt the "_sk" file
sleep 2
cp ./users/peer2/msp/keystore/*_sk ./users/peer2/msp/keystore/key.pem

echo "CorpBrasilia Admin @ RCA"
fabric-ca-client enroll -u https://admin-corpbrasilia:admin-pwd@rca.corpbrasilia.blockchain.biz:7005 --mspdir users/admin/msp
# Adapt the "_sk" file
sleep 2
cp ./users/admin/msp/keystore/*_sk ./users/admin/msp/keystore/key.pem

echo "CorpBrasilia User @ RCA"
fabric-ca-client enroll -u https://user1-corpbrasilia:user1-pwd@rca.corpbrasilia.blockchain.biz:7005 --mspdir users/user1/msp
# Adapt the "_sk" file
sleep 2
cp ./users/user1/msp/keystore/*_sk ./users/user1/msp/keystore/key.pem

echo "CorpBrasilia Orderer @ RCA"
fabric-ca-client enroll -u https://orderer1-corpbrasilia:orderer1-pwd@rca.corpbrasilia.blockchain.biz:7005 --mspdir users/orderer1/msp
# Adapt the "_sk" file
sleep 2
cp ./users/orderer1/msp/keystore/*_sk ./users/orderer1/msp/keystore/key.pem
