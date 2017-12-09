//
//  Account.swift
//  ark-swift-iOS
//
//  Created by Sacha DSO on 09/12/2017.
//  Copyright © 2017 ark-swift. All rights reserved.
//

import Foundation

struct Account {
    
    /// Address of account.
    var address: String
    
    /// Balance of account.
    var balance: Balance?
    
    /// Public key of account.
    var publicKey: String?
    
    // Second signature public key.
    var secondPublicKey: String?
    
    /// If account enabled second signature.
    var secondSignature: Bool?
    
    /// If account enabled second signature, but it's still not confirmed.
    var unconfirmedSignature: Bool?
    
    init() {
        self.address = "unknown"
    }
    
    init(address: String) {
        self.address = address
    }
}
