#!/bin/bash
# ----------
# SPDX-License-Identifier: Apache-2.0
# ----------
#

echo "RCA Reset"
sudo chown -R $(whoami) ../*

rm -rf ./users/*
rm -rf ./client/tls*
