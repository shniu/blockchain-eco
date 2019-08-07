# 启动一个测试网络
# 可以考虑使用docker, 镜像为: eosio/eos-dev, for local development

sudo docker pull eosio/eos-dev

# 启动 eosio node

sudo docker run --rm --name eosio-dev -d -p 8888:8888 -p 9876:9876 -v /tmp/work:/work -v /tmp/eosio/data:/mnt/dev/data -v /tmp/eosio/config:/mnt/dev/config eosio/eos-dev  /bin/bash -c "nodeos -e -p eosio --plugin eosio::wallet_api_plugin --plugin eosio::wallet_plugin --plugin eosio::producer_plugin --plugin eosio::history_plugin --plugin eosio::chain_api_plugin --plugin eosio::history_api_plugin --plugin eosio::http_plugin -d /mnt/dev/data --config-dir /mnt/dev/config --http-server-address=0.0.0.0:8888 --access-control-allow-origin=* --contracts-console"

# check logs
sudo docker logs --tail 10 eosio-dev

# so, You have a very simple single node blockchain running in your Docker container!

# 为 cleos 创建快捷访问方式
alias cleosdev='sudo docker exec eosio-dev /opt/eosio/bin/cleos --wallet-url http://localhost:8888'

# 如果想停掉docker的话，run
sudo docker stop eosio-dev


# 下面来创建钱包、账户、key

cleosdev create wallet -n shniu
# 这里会产生 wallet 的密码，记下来

# 列出所有钱包
cleosdev wallet list

# 锁定钱包
cleosdev wallet lock -n shniu

# 解锁钱包
cleosdev wallet unlock -n shniu

# 创建公私钥对
cleosdev create key

# 把私钥导入钱包
cleosdev wallet import -n shniu ${private_key_1}


# 创建一个账户
# 创建账户钱，先把eosio账户的公私钥导入钱包
cleosdev wallet import 5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3

# 创建新账户
cleosdev create account eosio myaccount ${public_key_1} ${public_key_2}


# --------------------------------
# 智能合约
# 创建 eosio.token 账户
cleosdev create account eosio eosio.token ${public_key_1} ${public_key_2}

# 部署合约
cleosdev set contract eosio.token contracts/eosio.token -p eosio.token

# 发行代币
cleosdev push action eosio.token create '[ "eosio", "1000000000.0000 SYS"]' -p eosio.token

# 初始化某个账户代币
cleosdev push action eosio.token issue '[ "user", "100.0000 SYS", "this is a test" ]' -p eosio
cleosdev push action eosio.token issue '["user", "100.0000 SYS", "memo"]' -p eosio -d -j

# 转账
cleosdev push action eosio.token transfer '[ "user", "tester", "25.0000 SYS", "m" ]' -p user

# 查询账户下的资产
cleosdev get account user



