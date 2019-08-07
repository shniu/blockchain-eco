
sudo docker run -d --restart=unless-stopped --name keosd   \
  -v /home/blockchain/eosio-mainnet/eosio-wallet:/opt/eosio/bin/data-dir  \
    -v /home/blockchain/eosio-mainnet/eosio-wallet:/root/eosio-wallet \
	  -t eosio/eos /opt/eosio/bin/keosd  \
	    --wallet-dir /opt/eosio/bin/data-dir \
		  --http-server-address=127.0.0.1:8900
