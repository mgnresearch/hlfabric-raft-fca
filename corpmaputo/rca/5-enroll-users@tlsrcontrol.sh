#!/bin/bash
# ----------
# SPDX-License-Identifier: Apache-2.0
# ----------
#

cp ../../tlsrcontrol/ca/client/tls-ca/ca-tlsrcontrol-tls-cert.pem ./client/tls-ca/

export FABRIC_CA_CLIENT_HOME=$PWD
export FABRIC_CA_CLIENT_TLS_CERTFILES=./client/tls-ca/ca-tlsrcontrol-tls-cert.pem
cat $FABRIC_CA_CLIENT_TLS_CERTFILES

echo "CorpMaputo Peers @ TLS"
fabric-ca-client enroll -u https://peer1-corpmaputo:peer1-pwd@ca.tlsrcontrol.blockchain.biz:5005 --mspdir users/peer1/tls-msp --enrollment.profile tls --csr.hosts peer1.corpmaputo.blockchain.biz
# Adapt the "_sk" file
sleep 2
cp ./users/peer1/tls-msp/keystore/*_sk ./users/peer1/tls-msp/keystore/key.pem

fabric-ca-client enroll -u https://peer2-corpmaputo:peer2-pwd@ca.tlsrcontrol.blockchain.biz:5005 --mspdir users/peer2/tls-msp --enrollment.profile tls --csr.hosts peer2.corpmaputo.blockchain.biz
# Adapt the "_sk" file
sleep 2
cp ./users/peer2/tls-msp/keystore/*_sk ./users/peer2/tls-msp/keystore/key.pem

# -------------------------------------------------------------------

echo "CorpMaputo User @ TLS"
fabric-ca-client enroll -u https://user1-corpmaputo:user1-pwd@ca.tlsrcontrol.blockchain.biz:5005 --mspdir users/user1/tls-msp --enrollment.profile tls
# Adapt the "_sk" file
sleep 2
cp ./users/user1/tls-msp/keystore/*_sk ./users/user1/tls-msp/keystore/key.pem

echo "CorpMaputo Orderer @ TLS"
fabric-ca-client enroll -u https://orderer1-corpmaputo:orderer1-pwd@ca.tlsrcontrol.blockchain.biz:5005 --mspdir users/orderer1/tls-msp --enrollment.profile tls
# Adapt the "_sk" file
sleep 2
cp ./users/orderer1/tls-msp/keystore/*_sk ./users/orderer1/tls-msp/keystore/key.pem

