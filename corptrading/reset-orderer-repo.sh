#!/bin/bash
# ----------
# SPDX-License-Identifier: Apache-2.0
# ----------
#
sudo chown -R $(whoami) ../*

echo "CorpTrading (orderer) cleaning"
rm -rf ./orderer1/production/*
rm -rf ./orderer2/production/*
rm -rf ./orderer3/production/*
rm -rf ./orderer4/production/*

echo "Orderer's reseted"
