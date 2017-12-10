//
//  ark-swiftTests.swift
//  ark-swift
//
//  Created by S4cha on 09/12/2017.
//  Copyright © 2017 ark-swift. All rights reserved.
//

import Foundation
import XCTest
@testable import Ark
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
    
    func testCanRetrieveAccountBalance() {
        let account = Account(address: "A_VALID_ADDRESS")
        let exp = expectation(description: "Can retrieve account balance")
        account.fetchBalance().then { balance in
            XCTAssertEqual(balance.confirmed, 42)
            XCTAssertEqual(balance.unconfirmed, 200)
            exp.fulfill()
        }
        wait(for: [exp], timeout: 0.1)
    }
    
    func testCanRetrieveAccountPublicKey() {
        let exp = expectation(description: "Can retrieve account public key")
        account.fetchPublicKey().then { publicKey in
            XCTAssertEqual(publicKey, "AValidPublicKey")
            exp.fulfill()
        }
        wait(for: [exp], timeout: 0.1)
    }
    
    func testCanRetrieveAccountInformation() {
        let exp = expectation(description: "Can retrieve account Information")
        account.fetchInfo().then { account in
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
    
    func testCanRetrieveAccountDelegateFee() {
        let exp = expectation(description: "Can retrieve account public key")
        account.fetchDelegateFee().then { fee in
            XCTAssertEqual(fee, 6789)
            exp.fulfill()
        }
        wait(for: [exp], timeout: 0.1)
    }
    
    func testCanRetrieveAccountDelegates() {
        let exp = expectation(description: "Can retrieve account public key")
        account.fetchDelegates().then { delegates in
            XCTAssertEqual(delegates.count, 2)
            let d = delegates[1]
            XCTAssertEqual(d.username, "d2")
            exp.fulfill()
        }
        wait(for: [exp], timeout: 0.1)
    }
    
    func testCanRetrieveSupply() {
        let exp = expectation(description: "Can retrieve supply")
        Block.fetchSupply().then { supply in
            XCTAssertEqual(supply, 123456789)
            exp.fulfill()
        }
        wait(for: [exp], timeout: 0.1)
    }
    
    func testCanRetrieveReward() {
        let exp = expectation(description: "Can retrieve reward")
        Block.fetchReward().then { reward in
            XCTAssertEqual(reward, 589)
            exp.fulfill()
        }
        wait(for: [exp], timeout: 0.1)
    }
    
    func testCanRetrieveMilestone() {
        let exp = expectation(description: "Can retrieve milestone")
        Block.fetchMilestone().then { milestone in
            XCTAssertEqual(milestone, 12)
            exp.fulfill()
        }
        wait(for: [exp], timeout: 0.1)
    }
    
    func testCanRetrieveFee() {
        let exp = expectation(description: "Can retrieve fee")
        Block.fetchFee().then { fee in
            XCTAssertEqual(fee, 10000000)
            exp.fulfill()
        }
        wait(for: [exp], timeout: 0.1)
    }
    
    func testCanRetrieveNethash() {
        let exp = expectation(description: "Can retrieve nethash")
        Block.fetchNethash().then { nethash in
            XCTAssertEqual(nethash, "6e84d08bd299ed97c212c886c98a57e36545c8f5d645ca7eeae63a8bd62d8988")
            exp.fulfill()
        }
        wait(for: [exp], timeout: 0.1)
    }
    
    func testCanfetchTopAccounts() {
        let exp = expectation(description: "Can fecth top Accounts")
        Account.fetchTopAccounts().then { topAccounts in
            XCTAssertEqual(topAccounts.count, 2)
            let a = topAccounts[1]
            XCTAssertEqual(a.address, "2")
            exp.fulfill()
        }
        wait(for: [exp], timeout: 0.1)
    }
}

