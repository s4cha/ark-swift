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
    
    func testCanFetchBlocks() {
        let exp = expectation(description: "Can fetch blocks")
        Block.fetchBlocks().then { blocks in
            XCTAssertEqual(blocks.count, 2)
            let b = blocks[1]
            XCTAssertEqual(b.id, "7432845560996079685")
            XCTAssertEqual(b.version, 0)
            XCTAssertEqual(b.timestamp, 22825600)
            XCTAssertEqual(b.height, 2816164)
            XCTAssertEqual(b.previousBlock, "11152274710022062224")
            XCTAssertEqual(b.numberOfTransactions, 0)
            XCTAssertEqual(b.totalAmount, 0)
            XCTAssertEqual(b.totalFee, 0)
            XCTAssertEqual(b.reward, 200000000)
            XCTAssertEqual(b.payloadLength, 0)
            XCTAssertEqual(b.payloadHash, "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
            XCTAssertEqual(b.generatorPublicKey, "0217ff1ec656f2354a899bde097bb3131a9730fe491bb87dedb96489120be9154f")
            XCTAssertEqual(b.generatorId, "AXzEMF7TC1aH3ax1Luxk6XdyKXDRxnBj4f")
            XCTAssertEqual(b.blockSignature, "3044022023505abfacb6538a0fd8db639dfb3078a34d601c3625533c92a629cb4dd7131c0220658d94e2834668430ee0be70f201820be7fe87574acf3d525f67c662acc7eb03")
            XCTAssertEqual(b.confirmations, 1)
            XCTAssertEqual(b.totalForged, "200000000")
            exp.fulfill()
        }
        wait(for: [exp], timeout: 0.1)
    }
    
    func testCanFetchBlockWithId() {
        let exp = expectation(description: "Can fetch block with id")
        let block = Block(id: "7432845560996079685")
        block.fetch().then { b in
            XCTAssertEqual(b.id, "7432845560996079685")
            XCTAssertEqual(b.version, 0)
            XCTAssertEqual(b.timestamp, 22825600)
            XCTAssertEqual(b.height, 2816164)
            XCTAssertEqual(b.previousBlock, "11152274710022062224")
            XCTAssertEqual(b.numberOfTransactions, 0)
            XCTAssertEqual(b.totalAmount, 0)
            XCTAssertEqual(b.totalFee, 0)
            XCTAssertEqual(b.reward, 200000000)
            XCTAssertEqual(b.payloadLength, 0)
            XCTAssertEqual(b.payloadHash, "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
            XCTAssertEqual(b.generatorPublicKey, "0217ff1ec656f2354a899bde097bb3131a9730fe491bb87dedb96489120be9154f")
            XCTAssertEqual(b.generatorId, "AXzEMF7TC1aH3ax1Luxk6XdyKXDRxnBj4f")
            XCTAssertEqual(b.blockSignature, "3044022023505abfacb6538a0fd8db639dfb3078a34d601c3625533c92a629cb4dd7131c0220658d94e2834668430ee0be70f201820be7fe87574acf3d525f67c662acc7eb03")
            XCTAssertEqual(b.confirmations, 1)
            XCTAssertEqual(b.totalForged, "200000000")
            exp.fulfill()
        }
        wait(for: [exp], timeout: 0.1)
    }
    
    func testCanRetrieveSignatureFee() {
        let exp = expectation(description: "Can retrieve signature fee")
        Signature.fetchFee().then { fee in
            XCTAssertEqual(fee, 500000000)
            exp.fulfill()
        }
        wait(for: [exp], timeout: 0.1)
    }
    
    func testCanRetrieveSignatureFeeForAddress() {
        let exp = expectation(description: "Can retrieve signature fee for address")
        Signature.fetchFee(for: "AK3wUpsmyFrWvweRoHaEjuxUBE6").then { fee in
            XCTAssertEqual(fee, 500000000)
            exp.fulfill()
        }
        wait(for: [exp], timeout: 0.1)
    }
    
    func testCanRetrieveDelegatesCountForAccount() {
        let exp = expectation(description: "Can retrieve signature fee for address")
        let account = Account(address: "AK3wUpsmyFrWvweRoHaEjuxUBE6")
        account.fetchDelegatesCount().then { delegatesCount in
            XCTAssertEqual(delegatesCount, 608)
            exp.fulfill()
        }
        wait(for: [exp], timeout: 0.1)
    }
}

