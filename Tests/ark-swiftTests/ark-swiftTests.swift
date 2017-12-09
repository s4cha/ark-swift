//
//  ark-swiftTests.swift
//  ark-swift
//
//  Created by S4cha on 09/12/2017.
//  Copyright © 2017 ark-swift. All rights reserved.
//

import Foundation
import XCTest
import Ark
import then

class ArkswiftTests: XCTestCase {
    
    var account: Account!
    
    override func setUp() {
        super.setUp()
        // Inject Fake local Api
        api = MockApi()
        account = Account(address: "A_VALID_ADDRESS")
    }
    
    override func tearDown() {
        account = nil
        super.tearDown()
    }
    
    func testCanRetreiveAccountBalance() {
        let account = Account(address: "A_VALID_ADDRESS")
        let exp = expectation(description: "Can retrieve account balance")
        account.fetchBalance().then { balance in
            XCTAssertEqual(balance.confirmed, 42)
            XCTAssertEqual(balance.unconfirmed, 200)
            exp.fulfill()
        }
        wait(for: [exp], timeout: 0.1)
    }
    
    func testCanRetreiveAccountPublicKey() {
        let exp = expectation(description: "Can retrieve account public key")
        account.fetchPublicKey().then { publicKey in
            XCTAssertEqual(publicKey, "AValidPublicKey")
            exp.fulfill()
        }
        wait(for: [exp], timeout: 0.1)
    }
    
    func testCanRetreiveAccountInformation() {
        let exp = expectation(description: "Can retrieve account Information")
        account.fetchInfo().then { account in
            print(account)
            XCTAssertEqual(account.address, "anAccountAddress")
            XCTAssertEqual(account.balance?.confirmed, 123)
            XCTAssertEqual(account.balance?.unconfirmed, 456)
            XCTAssertEqual(account.publicKey, "aPublicKey")
            XCTAssertEqual(account.secondPublicKey, "aSecondPublicKey")
            XCTAssertEqual(account.secondSignature, true)
            XCTAssertEqual(account.unconfirmedSignature, false)
            exp.fulfill()
        }
        wait(for: [exp], timeout: 0.1)
    }
    
//    "unconfirmedBalance": "Unconfirmed balance of account. Integer",
//    "balance": "Balance of account. Integer",
//    "publicKey": "Public key of account. Hex",
//    "unconfirmedSignature": "If account enabled second signature, but it's still not confirmed. Boolean: true or false",
//    "secondSignature": "If account enabled second signature. Boolean: true or false",
//    "secondPublicKey": "Second signature public key. Hex"
}

class MockApi: Api {
    
    func fetchAccountBalance(for account: Account) -> Promise<Balance> {
        let fakeBalance = Balance(confirmed: 42, unconfirmed: 200)
        return Promise.resolve(fakeBalance)
    }
    
    func fetchPublicKey(for account: Account) -> Promise<String> {
        return Promise.resolve("AValidPublicKey")
    }
    
    func fetchAccountInfo(for account: Account) -> Promise<Account> {
        var fakeAccount = Account()
        fakeAccount.address = "anAccountAddress"
        fakeAccount.balance = Balance(confirmed: 123, unconfirmed: 456)
        fakeAccount.publicKey = "aPublicKey"
        fakeAccount.secondPublicKey = "aSecondPublicKey"
        fakeAccount.secondSignature = true
        fakeAccount.unconfirmedSignature = false
        return Promise.resolve(fakeAccount)
    }
}
