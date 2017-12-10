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
    
    func fetchNethash() -> Promise<String> {
        return Promise("6e84d08bd299ed97c212c886c98a57e36545c8f5d645ca7eeae63a8bd62d8988")
    }
    
    func fetchBlocks() -> Promise<[Block]> {
        return Promise([fakeBlock(), fakeBlock()])
    }
    
    func fetchBlock(with id: String) -> Promise<Block> {
        return Promise(fakeBlock())
    }
    
    func fakeBlock() -> Block {
        var fakeBlock = Block()
        fakeBlock.id = "7432845560996079685"
        fakeBlock.version = 0
        fakeBlock.timestamp = 22825600
        fakeBlock.height = 2816164
        fakeBlock.previousBlock = "11152274710022062224"
        fakeBlock.numberOfTransactions = 0
        fakeBlock.totalAmount = 0
        fakeBlock.totalFee = 0
        fakeBlock.reward = 200000000
        fakeBlock.payloadLength = 0
        fakeBlock.payloadHash = "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
        fakeBlock.generatorPublicKey = "0217ff1ec656f2354a899bde097bb3131a9730fe491bb87dedb96489120be9154f"
        fakeBlock.generatorId = "AXzEMF7TC1aH3ax1Luxk6XdyKXDRxnBj4f"
        fakeBlock.blockSignature = "3044022023505abfacb6538a0fd8db639dfb3078a34d601c3625533c92a629cb4dd7131c0220658d94e2834668430ee0be70f201820be7fe87574acf3d525f67c662acc7eb03"
        fakeBlock.confirmations = 1
        fakeBlock.totalForged = "200000000"
        return fakeBlock
    }
    
    func fetchSignatureFee() -> Promise<Int> {
        return Promise(500000000)
    }
    
    func fetchSignatureFee(for address: String) -> Promise<Int> {
        return Promise(500000000)
    }
}
