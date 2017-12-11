//
//  Transaction.swift
//  ark-swift
//
//  Created by Sacha DSO on 11/12/2017.
//  Copyright © 2017 ark-swift. All rights reserved.
//

import Foundation

public struct Transaction {
    public var id: String!
    public var blockId: String?
    public var type: Int?
    public var date: Date?
    public var amount: Int?
    public var fee: Int?
    public var senderId: String?
    public var recipientId: String?
    public var senderPublicKey: String?
    public var signature: String?
    public var votes: [String]?
    public var confirmations: Int?
    
    public init() {
        self.id = "unknown"
    }
    
    public init(id: String) {
        self.id = id
    }
}
