#!/bin/bash
# ----------
# SPDX-License-Identifier: Apache-2.0
# ----------
#

# With fabric-ca-server running, prepare the TLS folders

# Copy the root certificate from the TLS-CA. 
mkdir -p ./client/tls-root-cert
cp ./server/ca-cert.pem ./client/tls-root-cert/rca-tlsring-ca-cert.pem
cat ./client/tls-root-cert/rca-tlsring-ca-cert.pem

# Copy the TLS certificate from the TLS_CA.
mkdir -p ./client/tls-ca
cp ./server/tls-cert.pem ./client/tls-ca/rca-tlsring-tls-cert.pem
cat ./client/tls-ca/rca-tlsring-tls-cert.pem

export FABRIC_CA_CLIENT_HOME=$PWD
export FABRIC_CA_CLIENT_TLS_CERTFILES=./client/tls-ca/rca-tlsring-tls-cert.pem
cat $FABRIC_CA_CLIENT_TLS_CERTFILES
