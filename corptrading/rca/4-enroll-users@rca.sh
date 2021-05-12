#!/bin/bash
# ----------
# SPDX-License-Identifier: Apache-2.0
# ----------
#

export FABRIC_CA_CLIENT_HOME=$PWD
export FABRIC_CA_CLIENT_TLS_CERTFILES=./client/tls-ca/rca-corptrading-tls-cert.pem
cat $FABRIC_CA_CLIENT_TLS_CERTFILES

echo "user listing at CA"
fabric-ca-client identity list --mspdir users/rca-admin/msp

echo "CorpTrading Admin @ RCA"
fabric-ca-client enroll -u https://admin-corptrading:admin-pwd@rca.corptrading.blockchain.biz:6005 --mspdir users/admin/msp
# Adapt "_sk" file
sleep 2
cp ./users/admin/msp/keystore/*_sk ./users/admin/msp/keystore/key.pem
#

echo "CorpTrading User @ RCA"
fabric-ca-client enroll -u https://user1-corptrading:user1-pwd@rca.corptrading.blockchain.biz:6005 --mspdir users/user1/msp
# Adapt "_sk" file
sleep 2
cp ./users/user1/msp/keystore/*_sk ./users/user1/msp/keystore/key.pem
#

# ==============================================
# Users of Orderer's for clustering of orderer

echo "CorpTrading Orderer 1 @ RCA"
fabric-ca-client enroll -u https://orderer1-corptrading:orderer1-pwd@rca.corptrading.blockchain.biz:6005 --mspdir users/orderer1/msp
# Adapt "_sk" file
sleep 2
cp ./users/orderer1/msp/keystore/*_sk ./users/orderer1/msp/keystore/key.pem
#

echo "CorpTrading Orderer 2 @ RCA"
fabric-ca-client enroll -u https://orderer2-corptrading:orderer2-pwd@rca.corptrading.blockchain.biz:6005 --mspdir users/orderer2/msp
# Adapt "_sk" file
sleep 2
cp ./users/orderer2/msp/keystore/*_sk ./users/orderer2/msp/keystore/key.pem
#

echo "CorpTrading Orderer 3 @ RCA"
fabric-ca-client enroll -u https://orderer3-corptrading:orderer3-pwd@rca.corptrading.blockchain.biz:6005 --mspdir users/orderer3/msp
# Adapt "_sk" file
sleep 2
cp ./users/orderer3/msp/keystore/*_sk ./users/orderer3/msp/keystore/key.pem
#

echo "CorpTrading Orderer 4 @ RCA"
fabric-ca-client enroll -u https://orderer4-corptrading:orderer4-pwd@rca.corptrading.blockchain.biz:6005 --mspdir users/orderer4/msp
# Adapt "_sk" file
sleep 2
cp ./users/orderer4/msp/keystore/*_sk ./users/orderer4/msp/keystore/key.pem
#