#!/bin/bash
# ----------
# SPDX-License-Identifier: Apache-2.0
# ----------
#

export FABRIC_CA_CLIENT_HOME=$PWD
export FABRIC_CA_CLIENT_TLS_CERTFILES=./client/tls-ca/rca-coffee-tls-cert.pem
cat $FABRIC_CA_CLIENT_TLS_CERTFILES
export RCA_SERVER=rca.coffee.blockchain.biz:7005

# Each node in the organization that transacts on the network needs to register with the CA
# The following command registers the organization CA bootstrap identity

echo "--------------"
fabric-ca-client identity list --mspdir users/rca-admin/msp

echo "Coffee Admin"
fabric-ca-client register --id.name admin-coffee --id.secret admin-pwd --id.type admin -u https://${RCA_SERVER} --mspdir users/rca-admin/msp --id.attrs '"hf.Registrar.Roles=client,admin",hf.Registrar.Attributes=*,hf.Revoker=true,hf.GenCRL=true,admin=true,abac.init=true:ecert'
sleep 2

echo "Coffee User"
fabric-ca-client register --id.name user1-coffee --id.secret user1-pwd --id.type client -u https://${RCA_SERVER} --mspdir users/rca-admin/msp --id.attrs '"hf.Registrar.Roles=client,member",hf.Registrar.Attributes=*:ecert'
sleep 2

# ----- 
echo "Coffee Peer0"
fabric-ca-client register --id.name peer0-coffee --id.secret peer0-pwd --id.type peer -u https://${RCA_SERVER} --mspdir users/rca-admin/msp --id.attrs 'hf.Registrar.Roles=peer,hf.Registrar.Attributes=*:ecert'
sleep 2

echo "Coffee Peer1"
fabric-ca-client register --id.name peer1-coffee --id.secret peer1-pwd --id.type peer -u https://${RCA_SERVER} --mspdir users/rca-admin/msp --id.attrs 'hf.Registrar.Roles=peer,hf.Registrar.Attributes=*:ecert'
sleep 2

# -----------------------------------
echo "--------------"
fabric-ca-client identity list --mspdir users/rca-admin/msp

echo " "
echo "END"
