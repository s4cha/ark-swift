//
//  Block.swift
//  ark-swift-iOS
//
//  Created by Sacha DSO on 09/12/2017.
//  Copyright © 2017 ark-swift. All rights reserved.
//

import Foundation

public struct Block {
    public var id: String
    public var version: Int?
    public var timestamp: Int?
    public var height: Int?
    public var previousBlock: String?
    public var numberOfTransactions: Int?
    public var totalAmount: Int?
    public var totalFee: Int?
    public var reward: Int?
    public var payloadLength: Int?
    public var payloadHash: String?
    public var generatorPublicKey: String?
    public var generatorId: String?
    public var blockSignature: String?
    public var confirmations: Int?
    public var totalForged: String?
    
    public init() {
        self.id = "unknown"
    }
    
    public init(id: String) {
        self.id = id
    }
}
