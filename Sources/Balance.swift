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
    public var confirmed: Float
    
    /// Unconfirmed balance of account.
    public var unconfirmed: Float
    
    public init() {
        confirmed = 0
        unconfirmed = 0
    }
    
    public init(confirmed: Float, unconfirmed: Float) {
        self.confirmed = confirmed
        self.unconfirmed = unconfirmed
    }
}
