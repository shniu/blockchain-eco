
## 启动docker

> https://developers.eos.io/eosio-nodeos/docs/docker-quickstart  官方地址

```
sudo docker pull eosio/eos-dev

sudo docker run --rm --name eosio -d -p 8888:8888 -p 9876:9876 -v /tmp/work:/work -v /tmp/eosio/data:/mnt/dev/data -v /tmp/eosio/config:/mnt/dev/config eosio/eos-dev  /bin/bash -c "nodeos -e -p eosio --plugin eosio::wallet_api_plugin --plugin eosio::wallet_plugin --plugin eosio::producer_plugin --plugin eosio::history_plugin --plugin eosio::chain_api_plugin --plugin eosio::history_api_plugin --plugin eosio::http_plugin -d /mnt/dev/data --config-dir /mnt/dev/config --http-server-address=0.0.0.0:8888 --access-control-allow-origin=* --contracts-console --http-validate-host=false"

sudo docker logs --tail 10 eosio

curl http://localhost:8888/v1/chain/get_info


// 我们要连接 party 的测试网络

alias cleos='sudo docker exec -it eosio /opt/eosio/bin/cleos -u http://seed.party.tc.ink:8888 --wallet-url http://0.0.0.0:8888'

// ok!

```

---

alias pcleos='sudo docker exec eosio-dev /opt/eosio/bin/cleos --wallet-url http://localhost:8888 -u  http://seed.party.tc.ink:8888'

pcleos system newaccount --stake-net '1 SYS' --stake-cpu '1 SYS' --buy-ram-kbytes 10 digcreditnsh creditotoken EOS7KLp9T9zYPCmVXrHXyizbg8Qh5HNfb9d2adiCDjSWMMBnr2VQA

cleosdev wallet create -n party

cleosdev wallet import 
