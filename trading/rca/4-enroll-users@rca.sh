#!/bin/bash
# ----------
# SPDX-License-Identifier: Apache-2.0
# ----------
#

export FABRIC_CA_CLIENT_HOME=$PWD
export FABRIC_CA_CLIENT_TLS_CERTFILES=./client/tls-ca/rca-trading-tls-cert.pem
cat $FABRIC_CA_CLIENT_TLS_CERTFILES
export RCA_SERVER=rca.trading.blockchain.biz:6005

echo "User listing at CA"
fabric-ca-client identity list --mspdir users/rca-admin/msp

echo "Trading Admin @ RCA"
fabric-ca-client enroll -u https://admin-trading:admin-pwd@${RCA_SERVER} --mspdir users/admin/msp
# Adapt "_sk" file
sleep 1
cp ./users/admin/msp/keystore/*_sk ./users/admin/msp/keystore/key.pem
#

echo "Trading User @ RCA"
fabric-ca-client enroll -u https://user1-trading:user1-pwd@${RCA_SERVER} --mspdir users/user1/msp
# Adapt "_sk" file
sleep 1
cp ./users/user1/msp/keystore/*_sk ./users/user1/msp/keystore/key.pem
#

# ==============================================
# Users of Orderer's for clustering of orderer

echo "Trading Orderer 0 @ RCA"
fabric-ca-client enroll -u https://orderer0-trading:orderer0-pwd@${RCA_SERVER} --mspdir users/orderer0/msp
# Adapt "_sk" file
sleep 1
cp ./users/orderer0/msp/keystore/*_sk ./users/orderer0/msp/keystore/key.pem
#

echo "Trading Orderer 1 @ RCA"
fabric-ca-client enroll -u https://orderer1-trading:orderer1-pwd@${RCA_SERVER} --mspdir users/orderer1/msp
# Adapt "_sk" file
sleep 1
cp ./users/orderer1/msp/keystore/*_sk ./users/orderer1/msp/keystore/key.pem
#

echo "Trading Orderer 2 @ RCA"
fabric-ca-client enroll -u https://orderer2-trading:orderer2-pwd@${RCA_SERVER} --mspdir users/orderer2/msp
# Adapt "_sk" file
sleep 1
cp ./users/orderer2/msp/keystore/*_sk ./users/orderer2/msp/keystore/key.pem
#

echo " "
echo "END"