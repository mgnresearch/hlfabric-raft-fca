#!/bin/bash
# ----------
# SPDX-License-Identifier: Apache-2.0
# ----------
#
sudo chown -R $(whoami) ../*

echo "Trading (orderer) cleaning"
rm -rf ./orderer0/production/*
rm -rf ./orderer1/production/*
rm -rf ./orderer2/production/*
rm -rf ./orderer3/production/*

echo "Orderer's reseted"

echo " "
echo "END"
