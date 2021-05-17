#!/usr/bin/env node
'use strict';

/*
#
# SPDX-License-Identifier: Apache-2.0
#
*/

const contractName = 'example02';
const contractVersion = '1.0.0';

const shim = require('fabric-shim');
const util = require('util');

var Chaincode = class {

  /**
   * Initialize the chaincode
   * @param {Context} stub 
   */
  async Init(stub) {
    console.info('========= example02 Init =========');
    let ret = stub.getFunctionAndParameters();
    console.info(ret);
    let args = ret.params;
    // initialise only if 4 parameters passed.
    if (args.length != 4) {
      return shim.error('Incorrect number of arguments. Expecting 4');
    }

    let A = args[0];
    let B = args[2];
    let Aval = args[1];
    let Bval = args[3];

    if (typeof parseInt(Aval) !== 'number' || typeof parseInt(Bval) !== 'number') {
      return shim.error('Expecting integer value for asset holding');
    }

    try {
      await stub.putState(A, Buffer.from(Aval));
      try {
        await stub.putState(B, Buffer.from(Bval));
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
      console.log(err);Avalbytes
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

    let A = args[0];
    let B = args[1];
    if (!A || !B) {
      throw new Error('asset holding must not be empty');
    }

    // Get the state from the ledger
    let Avalbytes = await stub.getState(A);
    if (!Avalbytes) {
      throw new Error('Failed to get state of asset holder A');
    }
    let Aval = parseInt(Avalbytes.toString());

    let Bvalbytes = await stub.getState(B);
    if (!Bvalbytes) {
      throw new Error('Failed to get state of asset holder B');
    }

    let Bval = parseInt(Bvalbytes.toString());
    // Perform the execution
    let amount = parseInt(args[2]);
    if (typeof amount !== 'number') {
      throw new Error('Expecting integer value for amount to be transaferred');
    }

    Aval = Aval - amount;
    Bval = Bval + amount;
    console.info(util.format('Aval = %d, Bval = %d\n', Aval, Bval));

    // Write the states back to the ledger
    await stub.putState(A, Buffer.from(Aval.toString()));
    await stub.putState(B, Buffer.from(Bval.toString()));

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

    let A = args[0];

    // Delete the key from the state in ledger
    await stub.deleteState(A);
  }

  /**
   * Query callback representing the query of a chaincode
   * @param {Context} stub 
   * @param {array} args 
   */
  async query(stub, args) {
    if (args.length != 1) {
      throw new Error('Incorrect number of arguments. Expecting name of the person to query')
    }

    let jsonResp = {};
    let A = args[0];

    // Get the state from the ledger
    let Avalbytes = await stub.getState(A);
    if (!Avalbytes) {
      jsonResp.error = 'Failed to get state for ' + A;
      throw new Error(JSON.stringify(jsonResp));
    }

    jsonResp.name = A;
    jsonResp.amount = Avalbytes.toString();
    console.info('Query Response:');
    console.info(jsonResp);
    return Avalbytes;
  }

  /**
   * Health Check
   * @param {Context} stub 
   * @param {array} args 
   */
  async healthCheck(stub, args) {
    
    let stateMessage = "Contract: " + contractName + ", with version: " + contractVersion + ", at date-time: " + this.getDateTime();

    return stateMessage.toString();
  }

  /**
   * Put date and time in string format
   */
  async getDateTime(){
    
    var current = new Date();

    var dateTimeStr = current.getFullYear() + "-" + (current.getMonth() + 1) + "-" + current.getDate() + 
                      " " + current.getHours() + ":" + current.getMinutes() + ":" + current.getSeconds();

    return dateTimeStr;
  }

};

shim.start(new Chaincode());
