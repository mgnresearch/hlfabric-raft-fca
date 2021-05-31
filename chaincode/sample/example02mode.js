#!/usr/bin/env node
'use strict';

/*
#
# SPDX-License-Identifier: Apache-2.0
#
*/

const contractName = 'example02mode';
const contractVersion = '1.0.0';

const shim = require('fabric-shim');
const util = require('util');

var Chaincode = class {

  /**
   * Initialize the chaincode
   * @param {Context} stub 
   */
  async Init(stub) {
    
    console.info('========= example02mode Init =========');
    let ret = stub.getFunctionAndParameters();
    
    console.info(ret);
    let args = ret.params;
    
    // initialise only if 4 parameters passed.
    if (args.length != 4) {
      return shim.error('Incorrect number of arguments. Expecting 4');
    }

    let argumentA = args[0];
    let argumentB = args[2];
    let argumentAval = args[1];
    let argumentBval = args[3];

    if (typeof parseInt(argumentAval) !== 'number' || typeof parseInt(argumentBval) !== 'number') {
      return shim.error('Expecting integer value for asset holding');
    }

    try {
      await stub.putState(argumentA, Buffer.from(argumentAval));
      
      try {
        await stub.putState(argumentB, Buffer.from(argumentBval));
        return shim.success();

      } catch (err) {
        return shim.error(err);
      }

    } catch (err) {
      return shim.error(err);
    }
  }

  /**
   * Invoke default process of chaincode
   * @param {Context} stub 
   */
  async Invoke(stub) {
    
    let ret = stub.getFunctionAndParameters();
    console.info(ret);
    
    let method = this[ret.fcn];
    
    if (!method) {
      console.log('no method of name:' + ret.fcn + ' found');
      return shim.success();
    }
    
    try {
      let payload = await method(stub, ret.params);
      return shim.success(payload);

    } catch (err) {
      console.log(err);
      return shim.error(err);
    }
  }

  /**
   * Invoke process inside chaincode
   * @param {Context} stub 
   * @param {array} args 
   */
  async invoke(stub, args) {

    if (args.length != 3) {
      throw new Error('Incorrect number of arguments. Expecting 3');
    }

    let argumentA = args[0];
    let argumentB = args[1];

    if (!argumentA || !argumentB) {
      throw new Error('asset holding must not be empty');
    }

    // Get the state from the ledger
    let argumentAvalbytes = await stub.getState(argumentA);
    if (!argumentAvalbytes) {
      throw new Error('Failed to get state of asset holder A');
    }
    let argumentAval = parseInt(argumentAvalbytes.toString());
    
    let argumentBvalbytes = await stub.getState(argumentB);
    if (!argumentBvalbytes) {
      throw new Error('Failed to get state of asset holder B');
    }
    let argumentBval = parseInt(argumentBvalbytes.toString());

    // Perform the execution
    let amount = parseInt(args[2]);
    if (typeof amount !== 'number') {
      throw new Error('Expecting integer value for amount to be transaferred');
    }

    argumentAval = argumentAval - amount;
    argumentBval = argumentBval + amount;

    console.info(util.format('Aval = %d, Bval = %d\n', argumentAval, argumentBval));

    // Write the states back to the ledger
    await stub.putState(argumentA, Buffer.from(argumentAval.toString()));
    await stub.putState(argumentB, Buffer.from(argumentBval.toString()));

  }

  /**
   * Deletes an entity from state
   * @param {Context} stub 
   * @param {array} args 
   */
  async delete(stub, args) {
    
    if (args.length != 1) {
      throw new Error('Incorrect number of arguments. Expecting 1');
    }

    let argumentToDelete = args[0];

    // Delete the key from the state in ledger
    await stub.deleteState(argumentToDelete);
  }

  /**
   * Query callback representing the query of a chaincode
   * @param {Context} stub 
   * @param {array} args 
   */
  async query(stub, args) {

    if (args.length != 1) {
      throw new Error('Incorrect number of arguments. Expecting name of the subject to query')
    }

    let jsonResp = {};
    let argumentAlfa = args[0];

    // Get the state from the ledger
    let chainStateBytes = await stub.getState(argumentAlfa);
    if (!chainStateBytes) {
      jsonResp.error = 'Failed to get state for ' + argumentAlfa;
      throw new Error(JSON.stringify(jsonResp));
    }

    jsonResp.name = argumentAlfa;
    jsonResp.amount = chainStateBytes.toString();

    console.info('Query Response:');
    console.info(jsonResp);

    return chainStateBytes;
  }

  /**
   * Health Check
   * @param {Context} stub 
   * @param {array} args 
   */
  async health(stub, args) {
    
    if (args.length != 1) {
      throw new Error('Incorrect number of arguments. Expecting name of the subject to query')
    }

    let jsonResp = {};
    let argumentAlfa = args[0];

    // Get the state from the ledger
    let chainStateBytes = await stub.getState(argumentAlfa);
    if (!chainStateBytes) {
      jsonResp.error = 'Failed to get state for ' + argumentAlfa;
      throw new Error(JSON.stringify(jsonResp));
    }

    jsonResp.name = argumentAlfa;
    jsonResp.amount = chainStateBytes.toString();

    console.info('Health Check Query Response to ' + argumentAlfa + ': ');
    console.info(jsonResp);

    var current = new Date();
    // Put date and time in string format
    var dateTimeStr = current.getFullYear() + "-" + (current.getMonth() + 1) + "-" + current.getDate() + 
                      " " + current.getHours() + ":" + current.getMinutes() + ":" + current.getSeconds();
    let stateMessage = "Contract: " + contractName + ", with version: " + contractVersion + ", at date-time: " + dateTimeStr;
    console.info(stateMessage);

    return chainStateBytes;
  }

};

shim.start(new Chaincode());
