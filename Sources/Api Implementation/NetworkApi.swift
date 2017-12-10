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
    
    let network: WS = {
        let ws = WS("https://api.arknode.net/api")
        ws.logLevels = .debug
        return ws
    }()
    
    func fetchTopAccounts() -> Promise<[Account]> {
        return network.get("/accounts/top", keypath: "accounts")
    }
    
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
    
    func fetchReward() -> Promise<Int> {
        return network.get("/blocks/getReward", keypath: "reward")
    }
    
    func fetchMilestone() -> Promise<Int> {
        return network.get("/blocks/getMilestone", keypath: "milestone")
    }
    
    func fetchFee() -> Promise<Int> {
        return network.get("/blocks/getFee", keypath: "fee")
    }
    
    func fetchNethash() -> Promise<String> {
        return network.get("/blocks/getNethash", keypath: "nethash")
    }
    
    func fetchBlocks() -> Promise<[Block]> {
        return network.get("/blocks", keypath: "blocks")
    }
    
    func fetchBlock(with id: String) -> Promise<Block> {
        return network.get("/blocks/get", params: ["id": id], keypath: "block")
    }
    
    func fetchSignatureFee() -> Promise<Int> {
        return network.get("/signatures/fee", keypath: "fee")
    }
    
    func fetchSignatureFee(for address: String) -> Promise<Int> {
        return network.get("/signatures/fee", params: ["address": address], keypath: "fee")
    }
    
    func fetchDelegatesCount(for address: String) -> Promise<Int> {
        return network.get("/delegates/coun", params: ["address": address], keypath: "count")
    }
}
