//
//  Account+Api.swift
//  ark-swift-iOS
//
//  Created by Sacha DSO on 09/12/2017.
//  Copyright © 2017 ark-swift. All rights reserved.
//

import Foundation
import then

extension Account {
    
    func fetchBalance() -> Promise<Int> {
        return api.fetchAccountBalance(for: self)
    }
    
    func fetchPublicKey() -> Promise<String> {
        return api.fetchPublicKey(for: self)
    }
    
    func fetchInfo() -> Promise<Account> {
        return api.fetchAccountInfo(for: self)
    }
}
