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
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        //// XCTAssertEqual(ark-swift().text, "Hello, World!")
    }
    
    static var allTests = [
        ("testExample", testExample),
    ]
    
    override func setUp() {
        super.setUp()
        // Inject Fake local Api
        api = MockApi()
    }
    
    func testCanRetreiveAccountBalance() {
        let account = Account(address: "A_VALID_ADDRESS")
        let exp = expectation(description: "Can retrieve account balance")
        account.fetchBalance().then { balance in
            XCTAssertEqual(balance, 42)
            exp.fulfill()
        }
        wait(for: [exp], timeout: 0.1)
    }
}

class MockApi: Api {
    func fetchAccountBalance(for account: Account) -> Promise<Int> {
        return Promise.resolve(42)
    }
    
    func fetchPublicKey(for account: Account) -> Promise<String> {
        return Promise.resolve("AValidPublicKeyfskdjfhksjfh322f32rfr")
    }
    
    func fetchAccountInfo(for account: Account) -> Promise<Account> {
        return Promise.resolve(Account())
    }
}
