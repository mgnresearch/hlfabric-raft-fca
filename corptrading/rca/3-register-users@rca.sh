#!/bin/bash
# ----------
# SPDX-License-Identifier: Apache-2.0
# ----------
#

# Each node in the organization that transacts on the network needs to register with the CA
# The following command registers the organization CA bootstrap identity

export FABRIC_CA_CLIENT_HOME=$PWD
export FABRIC_CA_CLIENT_TLS_CERTFILES=./client/tls-ca/rca-corptrading-tls-cert.pem
cat $FABRIC_CA_CLIENT_TLS_CERTFILES

echo "--------------"
fabric-ca-client identity list --mspdir users/rca-admin/msp

echo "CorpTrading Admin"
fabric-ca-client register --id.name admin-corptrading --id.secret admin-pwd --id.type admin -u https://rca.corptrading.blockchain.biz:6005 --mspdir users/rca-admin/msp --id.attrs '"hf.Registrar.Roles=client,admin",hf.Registrar.Attributes=*,hf.Revoker=true,hf.GenCRL=true,admin=true,abac.init=true:ecert'
sleep 2

echo "CorpTrading User1"
fabric-ca-client register --id.name user1-corptrading --id.secret user1-pwd --id.type client -u https://rca.corptrading.blockchain.biz:6005 --mspdir users/rca-admin/msp --id.attrs '"hf.Registrar.Roles=client,member",hf.Registrar.Attributes=*:ecert'
sleep 2

# ==============================================
# Users of Orderer's for clustering of orderer

echo "CorpTrading Orderer 1"
fabric-ca-client register --id.name orderer1-corptrading --id.secret orderer1-pwd --id.type orderer -u https://rca.corptrading.blockchain.biz:6005 --mspdir users/rca-admin/msp --id.attrs "hf.Registrar.Roles=orderer,hf.Registrar.Attributes=*:ecert"
sleep 2

echo "CorpTrading Orderer 2"
fabric-ca-client register --id.name orderer2-corptrading --id.secret orderer2-pwd --id.type orderer -u https://rca.corptrading.blockchain.biz:6005 --mspdir users/rca-admin/msp --id.attrs "hf.Registrar.Roles=orderer,hf.Registrar.Attributes=*:ecert"
sleep 2

echo "CorpTrading Orderer 3"
fabric-ca-client register --id.name orderer3-corptrading --id.secret orderer3-pwd --id.type orderer -u https://rca.corptrading.blockchain.biz:6005 --mspdir users/rca-admin/msp --id.attrs "hf.Registrar.Roles=orderer,hf.Registrar.Attributes=*:ecert"
sleep 2

echo "CorpTrading Orderer 4"
fabric-ca-client register --id.name orderer4-corptrading --id.secret orderer4-pwd --id.type orderer -u https://rca.corptrading.blockchain.biz:6005 --mspdir users/rca-admin/msp --id.attrs "hf.Registrar.Roles=orderer,hf.Registrar.Attributes=*:ecert"
sleep 2

# -----------------------------------
echo "--------------"
fabric-ca-client identity list --mspdir users/rca-admin/msp
