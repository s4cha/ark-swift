# ark-swift

[![Language: Swift 4](https://img.shields.io/badge/language-swift%204-f48041.svg?style=flat)](https://developer.apple.com/swift)
![Platform: iOS 8+](https://img.shields.io/badge/platform-iOS-blue.svg?style=flat)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Build Status](https://www.bitrise.io/app/9c254d1192dee0b6/status.svg?token=LJCBSpGJX4fHNdB4q1NTrQ)](https://www.bitrise.io/app/9c254d1192dee0b6)
[![codebeat badge](https://codebeat.co/badges/113d12a8-9bd1-434f-a4a1-5c88e3a4001a)](https://codebeat.co/projects/github-com-s4cha-ark-swift-master)
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

#### Get balance

Get the balance of an account.
```swift
account.fetchBalance().then { balance in
    print(balance)
}

//output: Balance(confirmed: 42, unconfirmed: 200)
```

#### Get account public key
Get the public key of an account.

```swift
account.fetchPublicKey().then { publicKey in
    print(publicKey)
}

//output: 4fh34jhd34kjdk234jdk5252fkjl4jfaldk324al23r25446
```






#### Get account information
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
