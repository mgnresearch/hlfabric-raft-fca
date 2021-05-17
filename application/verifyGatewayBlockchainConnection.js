#!/usr/bin/env node
'use strict';

/*
# SPDX-License-Identifier: Apache-2.0
*/

 // Bring key classes into scope, most importantly Fabric SDK network class
 const fs = require('fs');
 const path = require('path');
 const yaml = require('js-yaml');
 const { FileSystemWallet, InMemoryWallet, X509WalletMixin, Gateway } = require('fabric-network');
 
//=================================================================
 // Specify userName for network access
 const userName = 'user1';
 
 // organization MSP Id
 const orgMspId = 'CorpBrasiliaMSP';

 // Network configuration
 const networkYAML = './gateway/connection-profile.yaml';

 // Channel name
 const channelNAME = 'devchannel';

 // Peer name
 const peerName = 'peer1.corpbrasilia.blockchain.biz';
 //=================================================================

 // Main program function
async function main() {

    // A gateway defines the peers used to access Fabric networks
    const gateway = new Gateway();

    try {

		// hard coded path to read cert and key of Admin from sample_3PeerNetwork
		// check for private key file name, your generate command might have generated with a different name
		var certPath = '../corpbrasilia/rca/users/' + userName + '/msp/signcerts/cert.pem';
		var cert = fs.readFileSync(certPath).toString();
		var keystorePath = '../corpbrasilia/rca/users/' + userName + '/msp/keystore/key.pem';
		var keystore = fs.readFileSync(keystorePath).toString();

		// Create an instance of the file system wallet
		// const wallet = await Wallets.newFileSystemWallet('./WALLETS/wallet');
		// let wallet = new FileSystemWallet('./wallet');
		
		console.log('X509WalletMixin.createIdentity.');
		let identityX509 = X509WalletMixin.createIdentity(orgMspId, cert, keystore);
		
        // Create a new file system based wallet for managing identities.
        const walletPath = path.join(process.cwd(), 'wallet');
        let walletFS = new FileSystemWallet(walletPath);
        await walletFS.import(userName, identityX509);

        console.log('Successfully user identity imported it into the wallet');

        // Load connection profile; will be used to locate a gateway
        let connectionProfile = yaml.safeLoad(fs.readFileSync(networkYAML, 'utf8'));

        // Set connection options; identity and wallet
        let connectionOptions = {
            identity: userName,
            wallet: walletFS,
            discovery: { enabled:false, asLocalhost: false }
        };

        console.log('Before connect to Fabric gateway, using application specified parameters');
        
        await gateway.connect(connectionProfile, connectionOptions);
        console.log('After connect to Fabric Gateway.');

        console.log(`Access blockchain network. Use network channel: ${channelNAME} . `);

        var network = await gateway.getNetwork(channelNAME);
        console.log(`Network connection OK to: ${channelNAME} . `);

        console.log('Before getClient from Gateway');
        
        var client = gateway.getClient();
        console.log('After getClient from Gateway. Is in DevMode? = ' + client.isDevMode());
        
        var peer = client.getPeer(peerName);
        console.log('After getPeer from Client. Peer = ' + peer.toString());

        console.log('Test OK');

    } catch (error) {

        console.log('Test FAIL');
        console.log(`Error processing transaction. ${error}`);
        console.log(error.stack);

    } finally {

        // Disconnect from the gateway
        console.log('Disconnect from Fabric Gateway.');
        gateway.disconnect();
    }
}
main().then(() => {

    console.log('Program complete.');

}).catch((e) => {

    console.log('Program exception.');
    console.log(e);
    process.exit(-1);

});
