#!/bin/bash
# ----------
# SPDX-License-Identifier: Apache-2.0
# ----------
#

export FABRIC_CA_CLIENT_HOME=$PWD
export FABRIC_CA_CLIENT_TLS_CERTFILES=./client/tls-ca/rca-corplisboa-tls-cert.pem
cat $FABRIC_CA_CLIENT_TLS_CERTFILES

# Each node in the organization that transacts on the network needs to register with the CA
# The following command registers the organization CA bootstrap identity

echo "--------------"
fabric-ca-client identity list --mspdir users/rca-admin/msp

echo "CorpLisboa Admin"
fabric-ca-client register --id.name admin-corplisboa --id.secret admin-pwd --id.type admin -u https://rca.corplisboa.blockchain.biz:8005 --mspdir users/rca-admin/msp --id.attrs '"hf.Registrar.Roles=client,admin",hf.Registrar.Attributes=*,hf.Revoker=true,hf.GenCRL=true,admin=true,abac.init=true:ecert'
sleep 2

echo "CorpLisboa User"
fabric-ca-client register --id.name user1-corplisboa --id.secret user1-pwd --id.type client -u https://rca.corplisboa.blockchain.biz:8005 --mspdir users/rca-admin/msp --id.attrs '"hf.Registrar.Roles=client,member",hf.Registrar.Attributes=*:ecert'
sleep 2

# ----- 
echo "CorpLisboa Peer1"
fabric-ca-client register --id.name peer1-corplisboa --id.secret peer1-pwd --id.type peer -u https://rca.corplisboa.blockchain.biz:8005 --mspdir users/rca-admin/msp --id.attrs "hf.Registrar.Roles=peer,hf.Registrar.Attributes=*:ecert"
sleep 2

echo "CorpLisboa Peer2"
fabric-ca-client register --id.name peer2-corplisboa --id.secret peer2-pwd --id.type peer -u https://rca.corplisboa.blockchain.biz:8005 --mspdir users/rca-admin/msp --id.attrs "hf.Registrar.Roles=peer,hf.Registrar.Attributes=*:ecert"
sleep 2

echo "CorpLisboa Orderer"
fabric-ca-client register --id.name orderer1-corplisboa --id.secret orderer1-pwd --id.type orderer -u https://rca.corplisboa.blockchain.biz:8005 --mspdir users/rca-admin/msp --id.attrs "hf.Registrar.Roles=orderer,hf.Registrar.Attributes=*:ecert"
sleep 2

# -----------------------------------
echo "--------------"
fabric-ca-client identity list --mspdir users/rca-admin/msp
