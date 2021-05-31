
# Blockchain Hyperledger With Fabric CA, Fabric, Explorer, Raft, Chaincode and Monitoring

Establishing a corporate blockchain network in a productive environment has some challenges that must be solved by blockchain solution architects. This repository was organized from our experience in creating blockchain environments, quality and productive, for a software system that uses blockchain as a data storage solution in its backend to execute a decentralized and distributed multi-organization business process. 

The source-code will focus on how the blockchain architect may use sources to configure the Hyperledger frameworks together, Fabric CA + Fabric + Explorer, on a network with multiple Raft orderers, and how to guide the developmentto establish resources that can provide the monitoring over the blockchain components of organization, as well as the verification of each chaincode that is published in the system.

## Steps

1. Configure TLSR CA and create users at *TlsRing* organization:
    1. Startup TLSR CA: _rca.tlsring.blockchain.biz_;
    1. Configure TLSR CA running scripts;
    1. Register and enroll users at TLSR CA;
    1. Stay with TLSR CA on-line/loaded.
1. Prepare *Coffee* organization with PEER components:
    1. Configure RCA at *Coffee* organization and create users:
        1. Startup RCA: _rca.coffee.blockchain.biz_, running 'rca-init.sh';
        1. Configure RCA running scripts;
        1. Register and enroll users at RCA;
        1. Enroll users at TLSR CA;
        1. Shutdown RCA, running 'rca-stop.sh'.
    1. Startup *Coffee* organization components:
        1. Running 'srv-init.sh';
        1. Verify status running 'srv-check-status.sh';
        1. You may (or not) shutdown organization components, running 'srv-stop.sh'.
1. Prepare *Juice* organization with PEER components:
    1. Configure RCA at *Juice* organization and create users:
        1. Startup RCA: _rca.juice.blockchain.biz_, running 'rca-init.sh';
        1. Configure RCA running scripts;
        1. Register and enroll users at RCA;
        1. Enroll users at TLSR CA;
        1. Shutdown RCA, running 'rca-stop.sh';
    1. Startup *Juice* organization components:
        1. Running 'srv-init.sh';at *TlsRing* organization
        1. Verify status running 'srv-check-status.sh';
        1. You may (or not) shutdown organization components, running 'srv-stop.sh'.
1. Prepare *Trading* organization with ORDERER components:
    1. Configure RCA at *Trading* organization and create users:
        1. Startup RCA: _rca.trading.blockchain.biz_, running 'rca-init.sh';
        1. Configure RCA running scripts;
        1. Register and enroll users at RCA;
        1. Enroll users at TLSR CA;
        1. Shutdown RCA, running 'rca-stop.sh'.
1. Stop TLSR CA at *TlsRing* organization:
    1. Shutdown TLSR CA container.
1. Genesis:
    1. Inspect the file './configtx/confitx.yaml.
    1. Generate genesis block to run system channel, named _syschannel_:
        1. Run the file '1-generate-genesis-block.sh';
        1. Verify the file _"genesis.block"_ created at "./config" folder.
    1. Generate genesis transaction block to run development channel, named _devchannel_:
        1. Run the file '2-generate-genesis-tx.sh';
        1. Verify the file _"devchanneltrack.tx"_ created at "./config" folder.
1. Start Orderers
    1. Move to *Trading* organization;
    1. Startup components, running 'ordering-init.sh';
    1. Verify status running 'ordering-check-status.sh'.

### END

End
