//
//  Block+Api.swift
//  ark-swift
//
//  Created by Sacha DSO on 09/12/2017.
//  Copyright © 2017 ark-swift. All rights reserved.
//

import Foundation
import then

extension Block {
    
    /// Get the blockchain supply.
    static func fetchSupply() -> Promise<Int> {
        return api.fetchSuppy()
    }
    
    /// Get the blockchain reward.
    static func fetchReward() -> Promise<Int> {
        return api.fetchReward()
    }
}
