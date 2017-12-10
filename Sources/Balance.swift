//
//  Balance.swift
//  ark-swift-iOS
//
//  Created by Sacha DSO on 09/12/2017.
//  Copyright © 2017 ark-swift. All rights reserved.
//

import Foundation

public struct Balance {
    
    /// Balance of account.
    public var confirmed: Int
    
    /// Unconfirmed balance of account.
    public var unconfirmed: Int
    
    public init() {
        confirmed = 0
        unconfirmed = 0
    }
    
    public init(confirmed: Int, unconfirmed: Int) {
        self.confirmed = confirmed
        self.unconfirmed = unconfirmed
    }
}
