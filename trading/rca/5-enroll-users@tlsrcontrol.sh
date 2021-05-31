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

echo "Trading User @ TLS"
fabric-ca-client enroll -u https://user1-trading:user1-pwd@${TLSR_SERVER} --mspdir users/user1/tls-msp --enrollment.profile tls
# Adapt the "_sk" file
sleep 1
cp ./users/user1/tls-msp/keystore/*_sk ./users/user1/tls-msp/keystore/key.pem

# ==============================================
# Users of Orderer's for clustering of orderer

echo "Trading Orderer 0 @ TLS"
fabric-ca-client enroll -u https://orderer0-trading:orderer0-pwd@${TLSR_SERVER} --mspdir users/orderer0/tls-msp --enrollment.profile tls --csr.hosts orderer0.trading.blockchain.biz
# Adapt the "_sk" file
sleep 1
cp ./users/orderer0/tls-msp/keystore/*_sk ./users/orderer0/tls-msp/keystore/key.pem
#

echo "Trading Orderer 1 @ TLS"
fabric-ca-client enroll -u https://orderer1-trading:orderer1-pwd@${TLSR_SERVER} --mspdir users/orderer1/tls-msp --enrollment.profile tls --csr.hosts orderer1.trading.blockchain.biz
# Adapt the "_sk" file
sleep 1
cp ./users/orderer1/tls-msp/keystore/*_sk ./users/orderer1/tls-msp/keystore/key.pem

echo "Trading Orderer 2 @ TLS"
fabric-ca-client enroll -u https://orderer2-trading:orderer2-pwd@${TLSR_SERVER} --mspdir users/orderer2/tls-msp --enrollment.profile tls --csr.hosts orderer2.trading.blockchain.biz
# Adapt the "_sk" file
sleep 1
cp ./users/orderer2/tls-msp/keystore/*_sk ./users/orderer2/tls-msp/keystore/key.pem
#

echo " "
echo "END"
