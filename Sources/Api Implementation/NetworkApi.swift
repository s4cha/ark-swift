//
//  NetworkApi.swift
//  ark-swift-iOS
//
//  Created by Sacha DSO on 09/12/2017.
//  Copyright © 2017 ark-swift. All rights reserved.
//

import Foundation
import ws
import then

struct NetworkApi: Api {

    static let instance = NetworkApi()
    
    let network = WS("https://api.arknode.net/api")
    
    func fetchAccountBalance(for account: Account) -> Promise<Balance> {
        return network.get("/accounts/getBalance",
                           params: ["address" : account.address])
    }
    
    func fetchPublicKey(for account: Account) -> Promise<String> {
        return network.get("/accounts/getPublickey",
                           params: ["address" : account.address],
                           keypath: "publicKey")
    }
    
    func fetchAccountInfo(for account: Account) -> Promise<Account> {
        return network.get("/accounts",
                           params: ["address" : account.address],
                           keypath: "account")
    }
    
    func fetchAccountDelegateFee() -> Promise<Int> {
        return network.get("/accounts/delegates/fee", keypath: "fee")
    }
    
    func fetchAccountDelegates(for account: Account) -> Promise<[Delegate]> {
        return network.get("/accounts/delegates",
                           params: ["address" : account.address],
                           keypath: "delegates")
    }
    
    func fetchSuppy() -> Promise<Int> {
        return network.get("/blocks/getSupply", keypath: "supply")
    }
}
