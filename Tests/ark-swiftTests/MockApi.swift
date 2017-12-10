//
//  MockApi.swift
//  ark-swift-iOS Tests
//
//  Created by Sacha DSO on 10/12/2017.
//  Copyright © 2017 ark-swift. All rights reserved.
//

import Foundation
import then
@testable import Ark

class MockApi: Api {

    func fetchTopAccounts() -> Promise<[Account]> {
        return Promise([Account(address:"1"), Account(address:"2")])
    }
    
    func fetchAccountBalance(for account: Account) -> Promise<Balance> {
        let fakeBalance = Balance(confirmed: 42, unconfirmed: 200)
        return Promise(fakeBalance)
    }
    
    func fetchPublicKey(for account: Account) -> Promise<String> {
        return Promise("AValidPublicKey")
    }
    
    func fetchAccountInfo(for account: Account) -> Promise<Account> {
        var fakeAccount = Account()
        fakeAccount.address = "anAccountAddress"
        fakeAccount.balance = Balance(confirmed: 123, unconfirmed: 456)
        fakeAccount.publicKey = "aPublicKey"
        fakeAccount.secondPublicKey = "aSecondPublicKey"
        fakeAccount.secondSignature = true
        fakeAccount.unconfirmedSignature = false
        return Promise(fakeAccount)
    }
    
    func fetchAccountDelegateFee() -> Promise<Int> {
        return Promise(6789)
    }
    
    func fetchAccountDelegates(for account: Account) -> Promise<[Delegate]> {
        var d1 = Delegate()
        d1.username = "d1"
        var d2 = Delegate()
        d2.username = "d2"
        return Promise([d1, d2])
    }
    
    func fetchSuppy() -> Promise<Int> {
        return Promise(123456789)
    }
    
    func fetchReward() -> Promise<Int> {
        return Promise(589)
    }
    
    func fetchMilestone() -> Promise<Int> {
        return Promise(12)
    }
    
    func fetchFee() -> Promise<Int> {
        return Promise(10000000)
    }
}
