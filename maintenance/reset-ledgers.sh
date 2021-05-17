#!/bin/bash
# ----------
# SPDX-License-Identifier: Apache-2.0
# ----------
#
sudo chown -R $(whoami) ../*

echo "CorpTrading (orderer) cleaning"
rm -rf ../corptrading/orderer1/production/*
rm -rf ../corptrading/orderer2/production/*
rm -rf ../corptrading/orderer3/production/*
rm -rf ../corptrading/orderer4/production/*

echo "CorpBrasilia cleaning"
rm -rf ../corpbrasilia/peer1/ledger/*
rm -rf ../corpbrasilia/peer2/ledger/*

echo "CorpLisboa cleaning"
rm -rf ../corplisboa/peer1/ledger/*
rm -rf ../corplisboa/peer2/ledger/*

echo "CorpMaputo cleaning"
rm -rf ../corpmaputo/peer1/ledger/*
rm -rf ../corpmaputo/peer2/ledger/*

echo "Orderer's and Peer's reseted"
