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


//"transactions": [
//{

//"blockid": "7362111732935655288",
//"type": 3,
//"timestamp": 22832896,
//"amount": 0,
//"fee": 100000000,
//"senderId": "AK3wUpsmyFrWvgytFRoaHatEKj3uxUBZE6",
//"recipientId": "AK3wUpsmyFrWvgytFRoaHatEKj3uxUBZE6",
//"senderPublicKey": "02d17fcedfd9eb392982f7795c68f4a6e3a131e1feefa242d9aea83c13629730e1",
//"signature": "3045022100fb1fa8baa76bfa0fbb7673615f37ff3837919ac9881d77ebb875dc845ed6874e022001b85375f77516afafe508ca8d4c4a3cfa146e658ed9386e78dbf7fdab6b1981",
//"asset": {
//"votes": [
//"+031641ff081b93279b669f7771b3fbe48ade13eadb6d5fd85bdd025655e349f008"
//]
//},
//"confirmations": 5604
//},

