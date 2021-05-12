#!/bin/bash
# ----------
# SPDX-License-Identifier: Apache-2.0
# ----------
#

cp ../../tlsrcontrol/ca/client/tls-ca/ca-tlsrcontrol-tls-cert.pem ./client/tls-ca/

export FABRIC_CA_CLIENT_HOME=$PWD
export FABRIC_CA_CLIENT_TLS_CERTFILES=./client/tls-ca/ca-tlsrcontrol-tls-cert.pem
cat $FABRIC_CA_CLIENT_TLS_CERTFILES

echo "CorpTrading User @ TLS"
fabric-ca-client enroll -u https://user1-corptrading:user1-pwd@ca.tlsrcontrol.blockchain.biz:5005 --mspdir users/user1/tls-msp --enrollment.profile tls
# Adapt the "_sk" file
sleep 2
cp ./users/user1/tls-msp/keystore/*_sk ./users/user1/tls-msp/keystore/key.pem


# ==============================================
# Users of Orderer's for clustering of orderer

echo "CorpTrading Orderer 1 @ TLS"
fabric-ca-client enroll -u https://orderer1-corptrading:orderer1-pwd@ca.tlsrcontrol.blockchain.biz:5005 --mspdir users/orderer1/tls-msp --enrollment.profile tls --csr.hosts orderer1.corptrading.blockchain.biz
# Adapt the "_sk" file
sleep 2
cp ./users/orderer1/tls-msp/keystore/*_sk ./users/orderer1/tls-msp/keystore/key.pem
#

echo "CorpTrading Orderer 2 @ TLS"
fabric-ca-client enroll -u https://orderer2-corptrading:orderer2-pwd@ca.tlsrcontrol.blockchain.biz:5005 --mspdir users/orderer2/tls-msp --enrollment.profile tls --csr.hosts orderer2.corptrading.blockchain.biz
# Adapt the "_sk" file
sleep 2
cp ./users/orderer2/tls-msp/keystore/*_sk ./users/orderer2/tls-msp/keystore/key.pem
#

echo "CorpTrading Orderer 3 @ TLS"
fabric-ca-client enroll -u https://orderer3-corptrading:orderer3-pwd@ca.tlsrcontrol.blockchain.biz:5005 --mspdir users/orderer3/tls-msp --enrollment.profile tls --csr.hosts orderer3.corptrading.blockchain.biz
# Adapt the "_sk" file
sleep 2
cp ./users/orderer3/tls-msp/keystore/*_sk ./users/orderer3/tls-msp/keystore/key.pem
#

echo "CorpTrading Orderer 4 @ TLS"
fabric-ca-client enroll -u https://orderer4-corptrading:orderer4-pwd@ca.tlsrcontrol.blockchain.biz:5005 --mspdir users/orderer4/tls-msp --enrollment.profile tls --csr.hosts orderer4.corptrading.blockchain.biz
# Adapt the "_sk" file
sleep 2
cp ./users/orderer4/tls-msp/keystore/*_sk ./users/orderer4/tls-msp/keystore/key.pem
#