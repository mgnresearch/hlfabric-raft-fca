#!/bin/bash
# ----------
# SPDX-License-Identifier: Apache-2.0
# ----------
#

# Each node in the organization that transacts on the network needs to register with the CA
# The following command registers the organization CA bootstrap identity

export FABRIC_CA_CLIENT_HOME=$PWD
export FABRIC_CA_CLIENT_TLS_CERTFILES=./client/tls-ca/rca-trading-tls-cert.pem
cat $FABRIC_CA_CLIENT_TLS_CERTFILES
export RCA_SERVER=rca.trading.blockchain.biz:6005

echo "--------------"
fabric-ca-client identity list --mspdir users/rca-admin/msp

echo "Trading Admin"
fabric-ca-client register --id.name admin-trading --id.secret admin-pwd --id.type admin -u https://${RCA_SERVER} --mspdir users/rca-admin/msp --id.attrs '"hf.Registrar.Roles=client,admin",hf.Registrar.Attributes=*,hf.Revoker=true,hf.GenCRL=true,admin=true,abac.init=true:ecert'
sleep 1

echo "Trading User1"
fabric-ca-client register --id.name user1-trading --id.secret user1-pwd --id.type client -u https://${RCA_SERVER} --mspdir users/rca-admin/msp --id.attrs '"hf.Registrar.Roles=client,member",hf.Registrar.Attributes=*:ecert'
sleep 1

# ==============================================
# Users of Orderer's for clustering of orderer

echo "Trading Orderer 0"
fabric-ca-client register --id.name orderer0-trading --id.secret orderer0-pwd --id.type orderer -u https://${RCA_SERVER} --mspdir users/rca-admin/msp --id.attrs 'hf.Registrar.Roles=orderer,hf.Registrar.Attributes=*:ecert'
sleep 1

echo "Trading Orderer 1"
fabric-ca-client register --id.name orderer1-trading --id.secret orderer1-pwd --id.type orderer -u https://${RCA_SERVER} --mspdir users/rca-admin/msp --id.attrs 'hf.Registrar.Roles=orderer,hf.Registrar.Attributes=*:ecert'
sleep 1

echo "Trading Orderer 2"
fabric-ca-client register --id.name orderer2-trading --id.secret orderer2-pwd --id.type orderer -u https://${RCA_SERVER} --mspdir users/rca-admin/msp --id.attrs 'hf.Registrar.Roles=orderer,hf.Registrar.Attributes=*:ecert'
sleep 1

# -----------------------------------
echo "--------------"
fabric-ca-client identity list --mspdir users/rca-admin/msp

echo " "
echo "END"
