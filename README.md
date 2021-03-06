# Ethereum Helloworld

前置準備：安裝`truffle`、`ganache-cli`
```sh
npm install -g truffle ganache-cli
```

撰寫智能合約
```sh
# 建立hello資料夾
touch hello
cd hello

# 使用truffle初始化專案
truffle init

# 智能合約
touch contracts/HelloWorld.sol

# 編譯
truffle compile
```

啟動測試網路
```sh
# 使用ganache
ganache-cli --seed apple banana cherry

# 使用truffle develop
truffle develop
```
>以上兩者擇其一即可

Deploy
```sh
# 建立部署腳本
touch migrations/2_deploy_contracts.js

# 執行部署
truffle migrate

# 若要重新部署，可使用reset指令
truffle migrate --reset
```

與測試區塊鏈上的合約互動
```sh
# 啟動truffle console，可與測試鏈互動
truffle console

# 宣告contract變數
let contract

# 取得HelloWorld合約的instance
HelloWorld.deployed().then(instance => contract = instance)

# 呼叫合約上的sayHello方法(使用call來呼叫read only資料，就不需要耗費gas)
contract.sayHello.call()

# 呼叫echo方法
contract.echo("hello ethereum")
```

## 建立代幣

建立`SimpleToken`所需的合約以及部署腳本
```sh
# 建立SimpleToken合約
touch contracts/SimpleToken.sol

# 建立SimpleToken部署腳本
touch migrations/3_deploy_simple_token.js

# Compile
truffle compile

# Deploy
truffle migrate

# 啟動truffle console
truffle console
```

測試：從合約轉帳代幣到使用者帳戶
```js
let contract

// 取得SimpleToken合約
SimpleToken.deployed().then(instance => contract = instance)

// coinbase的balance(預設是第一個帳戶，也就是accounts[0])
contract.balanceOf(web3.eth.coinbase)

// accounts[1]的balance
contract.balanceOf(web3.eth.accounts[1])

// 從合約地址轉帳120個代幣給accounts[1]
contract.transfer(web3.eth.accounts[1], 120)

// 再次確認coinbase的balance
contract.balanceOf(web3.eth.coinbase)

// 再次確認accounts[1]的balance
contract.balanceOf(web3.eth.accounts[1])
```

## 建立符合ERC20的代幣

使用`OpenZeppelin`套件建立符合標準的代幣

```sh
touch package.json
```

```json
{
  "name": "hello",
  "version": "1.0.0",
  "license": "ISC"
}
```

安裝`zeppelin-solidity`
```sh
npm install zeppelin-solidity --save
```

建立HelloToken合約
```sh
# 使用truffle create contract指令建立合約
truffle create contract HelloToken
```

部署
```sh
# 建立部署腳本
touch migrations/4_deploy_hellotoken.js

truffle compile

truffle migrate --reset

# 啟動truffle console
truffle console
```

測試
```js
let contract

// 取得合約
HelloToken.deployed().then(instance => contract = instance)

// 合約地址
contract.address

// coinbase(account0)餘額
contract.balanceOf(web3.eth.coinbase)

// account1餘額
contract.balanceOf(web3.eth.accounts[1])

// coinbase轉帳給account1
contract.transfer(web3.eth.accounts[1], 240)

// 確認account0餘額
contract.balanceOf(web3.eth.accounts[0])

// 確認account1餘額
contract.balanceOf(web3.eth.accounts[1])
```

因為是標準代幣，所以也可以使用`MetaMask`確認Token

1. 連結測試鏈: `localhost:8545`
2. Import account: `private key`
3. Add token: `token contract address`