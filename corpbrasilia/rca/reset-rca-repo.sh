#!/bin/bash
# ----------
# SPDX-License-Identifier: Apache-2.0
# ----------
#

echo "RCA Reset"

rm -rf ./users/*
rm -rf ./server/*.pem
rm -rf ./server/*.db
rm -rf ./server/*PublicKey
rm -rf ./server/msp/*
rm -rf ./client/tls*
