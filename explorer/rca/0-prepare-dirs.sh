#!/bin/bash
# ----------
# SPDX-License-Identifier: Apache-2.0
# ----------
#

mkdir -p ./client
mkdir -p ./client/tls-root-cert
mkdir -p ./client/tls
mkdir -p ./users

cp -r -f ../../corpbrasilia/rca/client/* ./client
