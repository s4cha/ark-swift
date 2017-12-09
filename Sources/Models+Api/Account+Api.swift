//
//  Account+Api.swift
//  ark-swift-iOS
//
//  Created by Sacha DSO on 09/12/2017.
//  Copyright © 2017 ark-swift. All rights reserved.
//

import Foundation
import then

/// These are shortucts to call api actions through the Account Model for simplicity's sake.
extension Account {
    
    /// Get a list of top accounts.
    static func fetchTopAccounts() -> Promise<[Account]> {
        return api.fetchTopAccounts()
    }
    
    /// Get the balance of an account.
    func fetchBalance() -> Promise<Balance> {
        return api.fetchAccountBalance(for: self)
    }
    
    /// Get the public key of an account.
    func fetchPublicKey() -> Promise<String> {
        return api.fetchPublicKey(for: self)
    }
    
    /// Get the account information.
    func fetchInfo() -> Promise<Account> {
        return api.fetchAccountInfo(for: self)
    }
    
    /// Get the delegate fee of an account.
    func fetchDelegateFee() -> Promise<Int> {
        return api.fetchAccountDelegateFee()
    }
    
    /// Get the delegates of an account.
    func fetchDelegates() -> Promise<[Delegate]> {
        return api.fetchAccountDelegates(for: self)
    }
}
