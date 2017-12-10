//
//  Block+Api.swift
//  ark-swift
//
//  Created by Sacha DSO on 09/12/2017.
//  Copyright © 2017 ark-swift. All rights reserved.
//

import Foundation
import then

public extension Block {
    
    /// Get the blockchain supply.
    static func fetchSupply() -> Promise<Int> {
        return api.fetchSuppy()
    }
    
    /// Get the blockchain reward.
    static func fetchReward() -> Promise<Int> {
        return api.fetchReward()
    }
    
    /// Get the blockchain milestone.
    static func fetchMilestone() -> Promise<Int> {
        return api.fetchMilestone()
    }
    
    /// Get the transaction fee for sending "normal" transactions.
    static func fetchFee() -> Promise<Int> {
        return api.fetchFee()
    }
    
    /// Get the blockchain nethash.
    static func fetchNethash() -> Promise<String> {
        return api.fetchNethash()
    }
}
