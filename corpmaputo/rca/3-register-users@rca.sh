#!/bin/bash
# ----------
# SPDX-License-Identifier: Apache-2.0
# ----------
#

# Each node in the organization that transacts on the network needs to register with the CA
# The following command registers the organization CA bootstrap identity

export FABRIC_CA_CLIENT_HOME=$PWD
export FABRIC_CA_CLIENT_TLS_CERTFILES=./client/tls-ca/rca-corpmaputo-tls-cert.pem
cat $FABRIC_CA_CLIENT_TLS_CERTFILES

echo "--------------"
fabric-ca-client identity list --mspdir users/rca-admin/msp

echo "CorpMaputo Admin"
fabric-ca-client register --id.name admin-corpmaputo --id.secret admin-pwd --id.type admin -u https://rca.corpmaputo.blockchain.biz:9005 --mspdir users/rca-admin/msp --id.attrs '"hf.Registrar.Roles=client,admin",hf.Registrar.Attributes=*,hf.Revoker=true,hf.GenCRL=true,admin=true,abac.init=true:ecert'
sleep 2

echo "CorpMaputo User"
fabric-ca-client register --id.name user1-corpmaputo --id.secret user1-pwd --id.type client -u https://rca.corpmaputo.blockchain.biz:9005 --mspdir users/rca-admin/msp --id.attrs '"hf.Registrar.Roles=client,member",hf.Registrar.Attributes=*:ecert'
sleep 2

# ----- 
echo "CorpMaputo Peer1"
fabric-ca-client register --id.name peer1-corpmaputo --id.secret peer1-pwd --id.type peer -u https://rca.corpmaputo.blockchain.biz:9005 --mspdir users/rca-admin/msp --id.attrs "hf.Registrar.Roles=peer,hf.Registrar.Attributes=*:ecert"
sleep 2

echo "CorpMaputo Peer2"
fabric-ca-client register --id.name peer2-corpmaputo --id.secret peer2-pwd --id.type peer -u https://rca.corpmaputo.blockchain.biz:9005 --mspdir users/rca-admin/msp --id.attrs "hf.Registrar.Roles=peer,hf.Registrar.Attributes=*:ecert"
sleep 2

echo "CorpMaputo Orderer"
fabric-ca-client register --id.name orderer1-corpmaputo --id.secret orderer1-pwd --id.type orderer -u https://rca.corpmaputo.blockchain.biz:9005 --mspdir users/rca-admin/msp --id.attrs "hf.Registrar.Roles=orderer,hf.Registrar.Attributes=*:ecert"
sleep 2

# -----------------------------------
echo "--------------"
fabric-ca-client identity list --mspdir users/rca-admin/msp