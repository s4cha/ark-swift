//
//  Account.swift
//  ark-swift-iOS
//
//  Created by Sacha DSO on 09/12/2017.
//  Copyright © 2017 ark-swift. All rights reserved.
//

import Foundation

struct Account {
    
    var address: String
    
    /// This is the money on the account.
    var balance = 0
    var publicKey: String?
    var secondPublicKey: String?
    
    init() {
        self.address = "unknown"
    }
    
    init(address: String) {
        self.address = address
    }
}
