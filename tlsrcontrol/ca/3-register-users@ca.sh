#!/bin/bash
# ----------
# SPDX-License-Identifier: Apache-2.0
# ----------
#

# Each node in the organization that transacts on the network needs to register with the CA
# The following command registers the organization CA bootstrap identity

export FABRIC_CA_CLIENT_HOME=$PWD
export FABRIC_CA_CLIENT_TLS_CERTFILES=./client/tls-ca/ca-tlsrcontrol-tls-cert.pem
cat $FABRIC_CA_CLIENT_TLS_CERTFILES

echo "--------------"
fabric-ca-client identity list --mspdir users/tlsr-admin/msp

# -----------------------------------
echo "CorpBrasilia"

fabric-ca-client register --id.name user1-corpbrasilia --id.secret user1-pwd --id.type client -u https://ca.tlsrcontrol.blockchain.biz:5005 --mspdir users/tlsr-admin/msp --id.attrs '"hf.Registrar.Roles=client,member",hf.Registrar.Attributes=*:ecert'
sleep 2

fabric-ca-client register --id.name peer1-corpbrasilia --id.secret peer1-pwd --id.type peer -u https://ca.tlsrcontrol.blockchain.biz:5005 --mspdir users/tlsr-admin/msp --id.attrs "hf.Registrar.Roles=peer,hf.Registrar.Attributes=*:ecert"
sleep 2

fabric-ca-client register --id.name peer2-corpbrasilia --id.secret peer2-pwd --id.type peer  -u https://ca.tlsrcontrol.blockchain.biz:5005 --mspdir users/tlsr-admin/msp --id.attrs "hf.Registrar.Roles=peer,hf.Registrar.Attributes=*:ecert"
sleep 2

echo "CorpBrasilia Orderer 1 @ TLS"
fabric-ca-client register --id.name orderer1-corpbrasilia --id.secret orderer1-pwd --id.type orderer -u https://ca.tlsrcontrol.blockchain.biz:5005 --mspdir users/tlsr-admin/msp --id.attrs "hf.Registrar.Roles=orderer,hf.Registrar.Attributes=*:ecert"
sleep 2

# -----------------------------------
echo "CorpLisboa"

fabric-ca-client register --id.name user1-corplisboa --id.secret user1-pwd --id.type client -u https://ca.tlsrcontrol.blockchain.biz:5005 --mspdir users/tlsr-admin/msp --id.attrs '"hf.Registrar.Roles=client,member",hf.Registrar.Attributes=*:ecert'
sleep 2

fabric-ca-client register --id.name peer1-corplisboa --id.secret peer1-pwd --id.type peer -u https://ca.tlsrcontrol.blockchain.biz:5005 --mspdir users/tlsr-admin/msp --id.attrs "hf.Registrar.Roles=peer,hf.Registrar.Attributes=*:ecert"
sleep 2

fabric-ca-client register --id.name peer2-corplisboa --id.secret peer2-pwd --id.type peer -u https://ca.tlsrcontrol.blockchain.biz:5005 --mspdir users/tlsr-admin/msp --id.attrs "hf.Registrar.Roles=peer,hf.Registrar.Attributes=*:ecert"
sleep 2

echo "CorpLisboa Orderer 1 @ TLS"
fabric-ca-client register --id.name orderer1-corplisboa --id.secret orderer1-pwd --id.type orderer -u https://ca.tlsrcontrol.blockchain.biz:5005 --mspdir users/tlsr-admin/msp --id.attrs "hf.Registrar.Roles=orderer,hf.Registrar.Attributes=*:ecert"
sleep 2

# -----------------------------------
echo "CorpMaputo"

fabric-ca-client register --id.name user1-corpmaputo --id.secret user1-pwd --id.type client -u https://ca.tlsrcontrol.blockchain.biz:5005 --mspdir users/tlsr-admin/msp --id.attrs '"hf.Registrar.Roles=client,member",hf.Registrar.Attributes=*:ecert'
sleep 2

fabric-ca-client register --id.name peer1-corpmaputo --id.secret peer1-pwd --id.type peer -u https://ca.tlsrcontrol.blockchain.biz:5005 --mspdir users/tlsr-admin/msp --id.attrs "hf.Registrar.Roles=peer,hf.Registrar.Attributes=*:ecert"
sleep 2

fabric-ca-client register --id.name peer2-corpmaputo --id.secret peer2-pwd --id.type peer -u https://ca.tlsrcontrol.blockchain.biz:5005 --mspdir users/tlsr-admin/msp --id.attrs "hf.Registrar.Roles=peer,hf.Registrar.Attributes=*:ecert"
sleep 2

echo "CorpMaputo Orderer 1 @ TLS"
fabric-ca-client register --id.name orderer1-corpmaputo --id.secret orderer1-pwd --id.type orderer -u https://ca.tlsrcontrol.blockchain.biz:5005 --mspdir users/tlsr-admin/msp --id.attrs "hf.Registrar.Roles=orderer,hf.Registrar.Attributes=*:ecert"
sleep 2

# -----------------------------------
# Users of Orderer's for clustering of orderer

echo "CorpTrading User1 @ TLS"
fabric-ca-client register --id.name user1-corptrading --id.secret user1-pwd --id.type client -u https://ca.tlsrcontrol.blockchain.biz:5005 --mspdir users/tlsr-admin/msp --id.attrs '"hf.Registrar.Roles=client,member",hf.Registrar.Attributes=*:ecert'
sleep 2

echo "CorpTrading Orderer 1 @ TLS"
fabric-ca-client register --id.name orderer1-corptrading --id.secret orderer1-pwd --id.type orderer -u https://ca.tlsrcontrol.blockchain.biz:5005 --mspdir users/tlsr-admin/msp --id.attrs "hf.Registrar.Roles=orderer,hf.Registrar.Attributes=*:ecert"
sleep 2

echo "CorpTrading Orderer 2 @ TLS"
fabric-ca-client register --id.name orderer2-corptrading --id.secret orderer2-pwd --id.type orderer -u https://ca.tlsrcontrol.blockchain.biz:5005 --mspdir users/tlsr-admin/msp --id.attrs "hf.Registrar.Roles=orderer,hf.Registrar.Attributes=*:ecert"
sleep 2

echo "CorpTrading Orderer 3 @ TLS"
fabric-ca-client register --id.name orderer3-corptrading --id.secret orderer3-pwd --id.type orderer -u https://ca.tlsrcontrol.blockchain.biz:5005 --mspdir users/tlsr-admin/msp --id.attrs "hf.Registrar.Roles=orderer,hf.Registrar.Attributes=*:ecert"
sleep 2

echo "CorpTrading Orderer 4 @ TLS"
fabric-ca-client register --id.name orderer4-corptrading --id.secret orderer4-pwd --id.type orderer -u https://ca.tlsrcontrol.blockchain.biz:5005 --mspdir users/tlsr-admin/msp --id.attrs "hf.Registrar.Roles=orderer,hf.Registrar.Attributes=*:ecert"
sleep 2

# -----------------------------------
echo "--------------"
fabric-ca-client identity list --mspdir users/tlsr-admin/msp
