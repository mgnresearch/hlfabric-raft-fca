#!/bin/bash
# ----------
# SPDX-License-Identifier: Apache-2.0
# ----------
#

echo "NodeOUs:
  Enable: true
  ClientOUIdentifier:
    Certificate: cacerts/rca-coffee-blockchain-biz-7005.pem
    OrganizationalUnitIdentifier: client
  MemberOUIdentifier:
    Certificate: cacerts/rca-coffee-blockchain-biz-7005.pem
    OrganizationalUnitIdentifier: member
  PeerOUIdentifier:
    Certificate: cacerts/rca-coffee-blockchain-biz-7005.pem
    OrganizationalUnitIdentifier: peer
  AdminOUIdentifier:
    Certificate: cacerts/rca-coffee-blockchain-biz-7005.pem
    OrganizationalUnitIdentifier: admin
  OrdererOUIdentifier:
    Certificate: cacerts/rca-coffee-blockchain-biz-7005.pem
    OrganizationalUnitIdentifier: orderer" > ./users/config.yaml


export ORG_NAME=coffee

echo "admincerts > admin"
mkdir -p ./users/admin/msp/admincerts
cp ./users/admin/msp/signcerts/cert.pem ./users/admin/msp/admincerts/${ORG_NAME}-admin-cert.pem
cp ./users/config.yaml ./users/admin/msp/

# - - - 
export CRYPTO_PLACE=./users/user1
echo "admincerts > "${CRYPTO_PLACE}
mkdir -p ${CRYPTO_PLACE}/msp/admincerts
cp ./users/admin/msp/signcerts/cert.pem ${CRYPTO_PLACE}/msp/admincerts/${ORG_NAME}-admin-cert.pem

mkdir -p ${CRYPTO_PLACE}/msp/tlscacerts
cp ${CRYPTO_PLACE}/tls-msp/tlscacerts/*.pem ${CRYPTO_PLACE}/msp/tlscacerts/
cp ./users/config.yaml ${CRYPTO_PLACE}/msp/


#
echo "Remove config.yaml base"
rm ./users/config.yaml

echo " "
echo "END"
