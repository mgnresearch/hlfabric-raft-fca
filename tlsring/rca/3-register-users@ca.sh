#!/bin/bash
# ----------
# SPDX-License-Identifier: Apache-2.0
# ----------
#

# Each node in the organization that transacts on the network needs to register with the CA
# The following command registers the organization CA bootstrap identity

export FABRIC_CA_CLIENT_HOME=$PWD
export FABRIC_CA_CLIENT_TLS_CERTFILES=./client/tls-ca/rca-tlsring-tls-cert.pem
cat $FABRIC_CA_CLIENT_TLS_CERTFILES
export TLSR_SERVER=rca.tlsring.blockchain.biz:5005

echo "--------------"
fabric-ca-client identity list --mspdir users/tlsr-admin/msp

# -----------------------------------
echo "Coffee"

fabric-ca-client register --id.name user1-coffee --id.secret user1-pwd --id.type client -u https://${TLSR_SERVER} --mspdir users/tlsr-admin/msp --id.attrs '"hf.Registrar.Roles=client,member",hf.Registrar.Attributes=*:ecert'
sleep 1

fabric-ca-client register --id.name peer0-coffee --id.secret peer0-pwd --id.type peer -u https://${TLSR_SERVER} --mspdir users/tlsr-admin/msp --id.attrs 'hf.Registrar.Roles=peer,hf.Registrar.Attributes=*:ecert'
sleep 1

fabric-ca-client register --id.name peer1-coffee --id.secret peer1-pwd --id.type peer  -u https://${TLSR_SERVER} --mspdir users/tlsr-admin/msp --id.attrs 'hf.Registrar.Roles=peer,hf.Registrar.Attributes=*:ecert'
sleep 1

# -----------------------------------
echo "Juice"

fabric-ca-client register --id.name user1-juice --id.secret user1-pwd --id.type client -u https://${TLSR_SERVER} --mspdir users/tlsr-admin/msp --id.attrs '"hf.Registrar.Roles=client,member",hf.Registrar.Attributes=*:ecert'
sleep 1

fabric-ca-client register --id.name peer0-juice --id.secret peer0-pwd --id.type peer -u https://${TLSR_SERVER} --mspdir users/tlsr-admin/msp --id.attrs 'hf.Registrar.Roles=peer,hf.Registrar.Attributes=*:ecert'
sleep 1

fabric-ca-client register --id.name peer1-juice --id.secret peer1-pwd --id.type peer -u https://${TLSR_SERVER} --mspdir users/tlsr-admin/msp --id.attrs 'hf.Registrar.Roles=peer,hf.Registrar.Attributes=*:ecert'
sleep 1

# -----------------------------------
echo "Wine"

fabric-ca-client register --id.name user1-wine --id.secret user1-pwd --id.type client -u https://${TLSR_SERVER} --mspdir users/tlsr-admin/msp --id.attrs '"hf.Registrar.Roles=client,member",hf.Registrar.Attributes=*:ecert'
sleep 1

fabric-ca-client register --id.name peer0-wine --id.secret peer0-pwd --id.type peer -u https://${TLSR_SERVER} --mspdir users/tlsr-admin/msp --id.attrs 'hf.Registrar.Roles=peer,hf.Registrar.Attributes=*:ecert'
sleep 1

fabric-ca-client register --id.name peer1-wine --id.secret peer1-pwd --id.type peer -u https://${TLSR_SERVER} --mspdir users/tlsr-admin/msp --id.attrs 'hf.Registrar.Roles=peer,hf.Registrar.Attributes=*:ecert'
sleep 1


# -----------------------------------
# Users of Orderer's for clustering of orderer

echo "Trading User1 @ TLS"
fabric-ca-client register --id.name user1-trading --id.secret user1-pwd --id.type client -u https://${TLSR_SERVER} --mspdir users/tlsr-admin/msp --id.attrs '"hf.Registrar.Roles=client,member",hf.Registrar.Attributes=*:ecert'
sleep 1

fabric-ca-client register --id.name orderer0-trading --id.secret orderer0-pwd --id.type orderer -u https://${TLSR_SERVER} --mspdir users/tlsr-admin/msp --id.attrs 'hf.Registrar.Roles=orderer,hf.Registrar.Attributes=*:ecert'
sleep 1

fabric-ca-client register --id.name orderer1-trading --id.secret orderer1-pwd --id.type orderer -u https://${TLSR_SERVER} --mspdir users/tlsr-admin/msp --id.attrs 'hf.Registrar.Roles=orderer,hf.Registrar.Attributes=*:ecert'
sleep 1

fabric-ca-client register --id.name orderer2-trading --id.secret orderer2-pwd --id.type orderer -u https://${TLSR_SERVER} --mspdir users/tlsr-admin/msp --id.attrs 'hf.Registrar.Roles=orderer,hf.Registrar.Attributes=*:ecert'
sleep 1

# -----------------------------------
echo "--------------"
fabric-ca-client identity list --mspdir users/tlsr-admin/msp
