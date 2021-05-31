#!/bin/bash
# ----------
# SPDX-License-Identifier: Apache-2.0
# ----------
#
# Script to generate key, and certificate for HTTPS (SSL) Server

SSL_CERTS_PATH=./app/ssl-certs

echo "Generating key, and certificate for HTTPS (SSL) Server, path ${SSL_CERTS_PATH}"
openssl genrsa -out ${SSL_CERTS_PATH}/privatekey.pem 2048
openssl req -new -key ${SSL_CERTS_PATH}/privatekey.pem -out ${SSL_CERTS_PATH}/certrequest.csr
openssl x509 -req -in ${SSL_CERTS_PATH}/certrequest.csr -signkey ${SSL_CERTS_PATH}/privatekey.pem -out ${SSL_CERTS_PATH}/certificate.pem -days 1095
