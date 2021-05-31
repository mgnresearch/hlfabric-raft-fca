
# Instructions to prepare Hyperledeger Explorer configuration

1- Enroll users inside "./rca" folder

    a) Certify that service at "rca.tlsring.blockchain.biz" is running
    b) Certify that service at "rca.coffee.blockchain.biz" is running
    c) Run the scripts inside "./rca" folder to enroll users

2- Prepare Connection Profile

    a) Edit and adjust  the file "./explorer/app/config.json"
    b) Edit and adjust  the file "./explorer/app/platform/connection-profile/config-net.json"

3- Prepare file YAML to docker compose

    Edit and adjust the file "docker-compose.yaml"

4- Generate SSL Keys

    a) Create a passphrase string, and store in a safe place.
    
    b) Call "generate-key-certs.sh", using your passphrase string.

    c) Verify the contents inside "./app/ssl-certs" folder.

5- Start Services

    Call "explorer-init.sh"

6- Create Database

    a) Inside container "explorer.app", run command to copy files:

        mkdir -p /etc/hyperledger/exchangedata/fabric/postgreSQL/db/
        
        ls /etc/hyperledger/exchangedata/fabric/postgreSQL/db/
        
        ls /opt/explorer/app/persistence/fabric/postgreSQL/db/
        
        cp -r /opt/explorer/app/persistence/fabric/postgreSQL/db/* /etc/hyperledger/exchangedata/fabric/postgreSQL/db/
        
        ls /etc/hyperledger/exchangedata/fabric/postgreSQL/db/

    b) Inside container "explorer.db", run script to create database:
        
        ls /etc/hyperledger/exchangedata/fabric/postgreSQL/db/
        
        cd /etc/hyperledger/exchangedata/fabric/postgreSQL/db/
        
        ./createdb.sh

    c) Verify the result inside ẽxplorer.db" container:

        _You are now connected to database "fabricexplorer" as user "postgres"._

7- Shutdown Services

    Call "explorer-stop.sh"

8- Verify "./logs" folder
