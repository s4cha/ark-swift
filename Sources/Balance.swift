//
//  Balance.swift
//  ark-swift-iOS
//
//  Created by Sacha DSO on 09/12/2017.
//  Copyright © 2017 ark-swift. All rights reserved.
//

import Foundation

struct Balance {
    
    /// Balance of account.
    var confirmed: Int
    
    /// Unconfirmed balance of account.
    var unconfirmed: Int
    
    init() {
        confirmed = 0
        unconfirmed = 0
    }
    
    init(confirmed: Int, unconfirmed: Int) {
        self.confirmed = confirmed
        self.unconfirmed = unconfirmed
    }
}
