#!/bin/bash
# ----------
# SPDX-License-Identifier: Apache-2.0
# ----------
#
sudo chown -R $(whoami) ../*

echo "Trading (orderer) cleaning"
rm -rf ../trading/orderer0/production/*
rm -rf ../trading/orderer1/production/*
rm -rf ../trading/orderer2/production/*

echo "Coffee cleaning"
rm -rf ../coffee/peer0/ledger/*
rm -rf ../coffee/peer1/ledger/*

echo "Juice cleaning"
rm -rf ../juice/peer0/ledger/*
rm -rf ../juice/peer1/ledger/*

echo "Wine cleaning"
rm -rf ../wine/peer0/ledger/*
rm -rf ../wine/peer1/ledger/*

echo "Orderer's and Peer's reseted"
