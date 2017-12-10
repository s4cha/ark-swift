# ark-swift

[![Language: Swift 4](https://img.shields.io/badge/language-swift%204-f48041.svg?style=flat)](https://developer.apple.com/swift)
![Platform: iOS 8+](https://img.shields.io/badge/platform-iOS-blue.svg?style=flat)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Build Status](https://www.bitrise.io/app/9c254d1192dee0b6/status.svg?token=LJCBSpGJX4fHNdB4q1NTrQ)](https://www.bitrise.io/app/9c254d1192dee0b6)
[![codebeat badge](https://codebeat.co/badges/82517c1b-d4aa-4e8d-b8dc-fa8d9f6f49ce)](https://codebeat.co/projects/github-com-s4cha-ark-swift-master)
[![License: MIT](http://img.shields.io/badge/license-MIT-lightgrey.svg?style=flat)](https://github.com/s4cha/ark-swift/blob/master/LICENSE)
[![GitHub tag](https://img.shields.io/github/release/s4cha/ark-swift.svg)]()
<!-- [![CocoaPods compatible](https://img.shields.io/badge/Cocoapods-compatible-4BC51D.svg?style=flat)](https://cocoapods.org/pods/PUT_NAME_HERE) -->


Import `Ark` framework at the top of your file:
```swift
import Ark
```

### Account

```swift
let account = Account(address: "MY_ADDRESS")
```

#### Balance

Get the balance of an account.
```swift
account.fetchBalance().then { balance in
    print(balance)
}

//output: Balance(confirmed: 42, unconfirmed: 200)
```

#### Public key
Get the public key of an account.

```swift
account.fetchPublicKey().then { publicKey in
    print(publicKey)
}

//output: 4fh34jhd34kjdk234jdk5252fkjl4jfaldk324al23r25446
```

#### Information
Get the account information of an address.

```swift
account.fetchInfo().then { account in
    print(account)
}

//output:
Account(
  address: "anAccountAddress",
  balance: Optional(Balance(confirmed: 123, unconfirmed: 456)),
  publicKey: Optional("aPublicKey"),
  secondPublicKey: Optional("aSecondPublicKey"),
  secondSignature: Optional(true),
  unconfirmedSignature: Optional(false)
)
```

#### Delegate fee
Get the delegate fee of an account.

```swift
account.fetchDelegateFee().then { fee in
    print(fee)
}

//output: 2500000000
```

#### Delegates count
Get the count of delegates.

```swift
account.fetchDelegatesCount().then { delegatesCount in
    print(delegatesCount)
}

//output: 608
```

#### Delegates
Get the delegates of an account.

```swift
account.fetchDelegates().then { delegates in
    print(delegates)
}

//output:
[
  Delegate(
    username: "dr10",
    address: "ANwjGUcVbLXpqbBUWbjUBQWkr4MWVDuJu9",
    publicKey: "031641ff081b93279b669f7771b3fbe48ade13eadb6d5fd85bdd025655e349f008",
    vote: "146519050420810",
    producedBlocks: 35990,
    missedBlocks: 215,
    rate: 13,
    approval: 1.12,
    productivity: 99.4100037
  )
]
```

#### Top Accounts
Get a list of top accounts.
```swift
Account.fetchTopAccounts().then { topAccounts in
  print(topAccounts)
}

//output: [Account1, Account2, Account3 etc ...]
```

### Blockchain

#### Supply
Get the blockchain supply.

```swift
Block.fetchSupply().then { supply in
    print(supply)
}

//output: 13060596600000000
```

#### Reward
Get the blockchain reward.

```swift
Block.fetchReward().then { reward in
    print(reward)
}

//output: 200000000
```

#### Milestone
Get the blockchain milestone.

```swift
Block.fetchMilestone().then { milestone in
  print(milestone)
}

//output: 0
```

#### Fee
Get the transaction fee for sending "normal" transactions.

```swift
Block.fetchFee().then { fee in
    print(fee)
}

//output: 10000000
```

#### Nethash
Get the blockchain nethash.

```swift
Block.fetchNethash().then { nethash in
    print(nethash)
}

//output: 6e84d08bd299ed97c212c886c98a57e36545c8f5d645ca7eeae63a8bd62d8988
```

#### Blocks
Get all blocks.

```swift
Block.fetchBlocks().then { blocks in
    print(blocks)
}

//output: [Block1, Block2, Block3 etc ...]
```

#### Block
Get block by id.

```swift
let block = Block(id: "7432845560996079685")
block.fetch().then { block in
  print(block)
}

//output: Block(id: "7432845560996079685", version: Optional(0), timestamp: Optional(22825600), height: Optional(2816164), previousBlock: Optional("11152274710022062224"), numberOfTransactions: Optional(0), totalAmount: Optional(0), totalFee: Optional(0), reward: Optional(200000000), payloadLength: Optional(0), payloadHash: Optional("e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"), generatorPublicKey: Optional("0217ff1ec656f2354a899bde097bb3131a9730fe491bb87dedb96489120be9154f"), generatorId: Optional("AXzEMF7TC1aH3ax1Luxk6XdyKXDRxnBj4f"), blockSignature: Optional("3044022023505abfacb6538a0fd8db639dfb3078a34d601c3625533c92a629cb4dd7131c0220658d94e2834668430ee0be70f201820be7fe87574acf3d525f67c662acc7eb03"), confirmations: Optional(1), totalForged: Optional("200000000"))
```


### Signature

#### Fee
Get the fee for a signature.

```swift
Signature.fetchFee().then { fee in
    print(fee)
}

//output: 500000000
```

#### Fee for address
Get the fee for a signature on a specified address.

```swift
Signature.fetchFee(for: "AK3wUpsmyFrWvweRoHaEjuxUBE6").then { fee in
    print(fee)
}

//output: 500000000
```
