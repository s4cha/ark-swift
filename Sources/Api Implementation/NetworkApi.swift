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
    
    let network = WS("https://api.arknode.net")
    
    func fetchAccountBalance(for account: Account) -> Promise<Int> {
        return network.get("/api/accounts/getBalance",
                           params: ["address" : account.address],
                           keypath: "balance")
    }
    
    func fetchPublicKey(for account: Account) -> Promise<String> {
        return network.get("/api/accounts/getPublickey",
                           params: ["address" : account.address],
                           keypath: "publicKey")
    }
    
    func fetchAccountInfo(for account: Account) -> Promise<Account> {
        return network.get("/api/accounts", params: ["address" : account.address])
    }
}
