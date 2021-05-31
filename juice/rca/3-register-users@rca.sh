#!/bin/bash
# ----------
# SPDX-License-Identifier: Apache-2.0
# ----------
#

export FABRIC_CA_CLIENT_HOME=$PWD
export FABRIC_CA_CLIENT_TLS_CERTFILES=./client/tls-ca/rca-juice-tls-cert.pem
cat $FABRIC_CA_CLIENT_TLS_CERTFILES
export RCA_SERVER=rca.juice.blockchain.biz:8005

# Each node in the organization that transacts on the network needs to register with the CA
# The following command registers the organization CA bootstrap identity

echo "--------------"
fabric-ca-client identity list --mspdir users/rca-admin/msp

echo "Juice Admin"
fabric-ca-client register --id.name admin-juice --id.secret admin-pwd --id.type admin -u https://${RCA_SERVER} --mspdir users/rca-admin/msp --id.attrs '"hf.Registrar.Roles=client,admin",hf.Registrar.Attributes=*,hf.Revoker=true,hf.GenCRL=true,admin=true,abac.init=true:ecert'
sleep 2

echo "Juice User"
fabric-ca-client register --id.name user1-juice --id.secret user1-pwd --id.type client -u https://${RCA_SERVER} --mspdir users/rca-admin/msp --id.attrs '"hf.Registrar.Roles=client,member",hf.Registrar.Attributes=*:ecert'
sleep 2

# ----- 
echo "Juice Peer0"
fabric-ca-client register --id.name peer0-juice --id.secret peer0-pwd --id.type peer -u https://${RCA_SERVER} --mspdir users/rca-admin/msp --id.attrs 'hf.Registrar.Roles=peer,hf.Registrar.Attributes=*:ecert'
sleep 2

echo "Juice Peer1"
fabric-ca-client register --id.name peer1-juice --id.secret peer1-pwd --id.type peer -u https://${RCA_SERVER} --mspdir users/rca-admin/msp --id.attrs 'hf.Registrar.Roles=peer,hf.Registrar.Attributes=*:ecert'
sleep 2

# -----------------------------------
echo "--------------"
fabric-ca-client identity list --mspdir users/rca-admin/msp

echo " "
echo "END"
