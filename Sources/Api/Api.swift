//
//  Api.swift
//  ark-swift-iOS
//
//  Created by Sacha DSO on 09/12/2017.
//  Copyright © 2017 ark-swift. All rights reserved.
//

import Foundation
import then

protocol Api {
    
    // Account
    func fetchTopAccounts() -> Promise<[Account]>
    func fetchAccountBalance(for account: Account) -> Promise<Balance>
    func fetchPublicKey(for account: Account) -> Promise<String>
    func fetchAccountInfo(for account: Account) -> Promise<Account>
    func fetchAccountDelegateFee() -> Promise<Int>
    func fetchAccountDelegates(for account: Account) -> Promise<[Delegate]>
    
    // Block
    func fetchSuppy() -> Promise<Int>
    func fetchReward() -> Promise<Int>
    func fetchMilestone() -> Promise<Int>
    func fetchFee() -> Promise<Int>
    func fetchNethash() -> Promise<String>
    func fetchBlocks() -> Promise<[Block]>
    func fetchBlock(with id: String) -> Promise<Block>
    
    // Signature
    func fetchSignatureFee() -> Promise<Int>
    func fetchSignatureFee(for address: String) -> Promise<Int>
    
    // Delegates
    func fetchDelegatesCount(for address: String) -> Promise<Int>
    
    // Transactions
    func fetchTransactions(for address: String) -> Promise<[Transaction]>
}
