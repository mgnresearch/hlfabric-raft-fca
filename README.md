
# Blockchain Hyperledger With Fabric CA, Fabric, Explorer, Raft, Chaincode and Monitoring

Establishing a corporate blockchain network in a productive environment has some challenges that must be solved by blockchain solution architects. This repository was organized from our experience in creating blockchain environments, quality and productive, for a software system that uses blockchain as a data storage solution in its backend to execute a decentralized and distributed multi-organization business process. 

The source-code will focus on how the blockchain architect may use sources to configure the Hyperledger frameworks together, Fabric CA + Fabric + Explorer, on a network with multiple Raft orderers, and how to guide the developmentto establish resources that can provide the monitoring over the blockchain components of organization, as well as the verification of each chaincode that is published in the system.


## Steps

1. Configure TLSR CA and create users at *TlsControl* organization:
    1. Startup TLSR CA: _ca.tlsrcontrol.blockchain.biz_;
    1. Configure TLSR CA running scripts;
    1. Register and enroll users at TLSR CA;
    1. Stay with TLSR CA on-line/loaded.
1. Prepare *CorpBrasilia* organization components:
    1. Configure RCA at *CorpBrasilia* organization and create users:
        1. Startup RCA: _rca.corpbrasilia.blockchain.biz_, running 'corpbrasilia-rca-init.sh';
        1. Configure RCA running scripts;
        1. Register and enroll users at RCA;
        1. Enroll users at TLSR CA;
        1. Shutdown RCA.
    1. Startup *CorpBrasilia* organization components:
        1. Running 'corpbrasilia-all-init.sh';
        1. Verify status running 'corpbrasilia-check-status.sh';
        1. You may (or not) shutdown organization components, running 'corpbrasilia-all-stop.sh'.
1. Prepare *CorpLisboa* organization components:
    1. Configure RCA at *CorpLisboa* organization and create users:
        1. Startup RCA: _rca.corplisboa.blockchain.biz_, running 'corplisboa-rca-init.sh';
        1. Configure RCA running scripts;
        1. Register and enroll users at RCA;
        1. Enroll users at TLSR CA;
        1. Shutdown RCA.
    1. Startup *CorpLisboa* organization components:
        1. Running 'corplisboa-all-init.sh';
        1. Verify status running 'corplisboa-check-status.sh';
        1. You may (or not) shutdown organization components, running 'corplisboa-all-stop.sh'.
1. Prepare *CorpMaputo* organization components:
    1. Configure RCA at *CorpMaputo* organization and create users:
        1. Startup RCA: _rca.corpmaputo.blockchain.biz_, running 'corpmaputo-rca-init.sh';
        1. Configure RCA running scripts;
        1. Register and enroll users at RCA;
        1. Enroll users at TLSR CA;
        1. Shutdown RCA.
    1. Startup *CorpMaputo* organization components:
        1. Running 'corpmaputo-all-init.sh';
        1. Verify status running 'corpmaputo-check-status.sh';
        1. You may (or not) shutdown organization components, running 'corpmaputo-all-stop.sh'.
1. Prepare *CorpTrading* organization components:
    1. Configure RCA at *CorpTrading* organization and create users:
        1. Startup RCA: _rca.corptrading.blockchain.biz_, running 'corptrading-rca-init.sh';
        1. Configure RCA running scripts;
        1. Register and enroll users at RCA;
        1. Enroll users at TLSR CA;
        1. Shutdown RCA.
1. Stop TLSR CA
    1. Shutdown TLSR CA container.
1. Genesis:
    1. Inspect the file './configtx/confitx.yaml;
    1. Generate genesis block to run system channel, named _syschannel_:
        1. Run the file '1-generate-genesis-block.sh';
        1. Verify the file _"genesis.block"_ created at "./configtx" folder.
    1. Generate genesis transaction block to run development channel, named _devchannel_:
        1. Run the file '2-generate-genesis-tx.sh';
        1. Verify the file _"devchanneltrack.tx"_ created at "./configtx" folder.
1. Start Orderers
    1. Move to *CorpTrading* organization;
    1. Startup components, running 'corptrading-all-init.sh';
    1. Verify status running 'corptrading-check-status.sh';

### END

End
