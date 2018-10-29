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
ganache-cli --seed apple banana cherry
```

Deploy
```sh
# 建立部署腳本
touch migrations/2_deploy_contracts.js

# 執行部署
truffle migrate
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
```