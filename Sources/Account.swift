//
//  Account.swift
//  ark-swift-iOS
//
//  Created by Sacha DSO on 09/12/2017.
//  Copyright © 2017 ark-swift. All rights reserved.
//

import Foundation

public struct Account {
    
    /// Address of account.
    public var address: String
    
    /// Balance of account.
    public var balance: Balance?
    
    /// Public key of account.
    public var publicKey: String?
    
    // Second signature public key.
    public var secondPublicKey: String?
    
    /// If account enabled second signature.
    public var secondSignature: Bool?
    
    /// If account enabled second signature, but it's still not confirmed.
    public var unconfirmedSignature: Bool?
    
    public init() {
        self.address = "unknown"
    }
    
    public init(address: String) {
        self.address = address
    }
}
