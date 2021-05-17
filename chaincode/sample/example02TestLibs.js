#!/usr/bin/env node
'use strict';

/*
# Author: Magno Alves Cavalcante < magno@cavalcante.eng.br >
#
# SPDX-License-Identifier: Apache-2.0
*/

/**
 * This script is used to load classes and scripts in order to eval syntax in source-code.
 */

console.log("Pre Test of loading chaincode class");

const { Contract, Context } = require('fabric-contract-api');
const shim = require('fabric-shim');
const util = require('util');

console.log("Node libraries loaded");

console.log("Testing the local requirement classes");

const Example02 = require('./example02.js');
var preExample02 = new Example02();

try {
    let dateTimeStr = preExample02.getDateTime();
    console.log("Local test: " + dateTimeStr);

    console.log("Local requirement classes loaded");

} catch (err) {
    console.error(err);
}

module.exports.contracts = [Example02];
