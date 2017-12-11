//
//  Transaction+JSON.swift
//  ark-swift
//
//  Created by Sacha DSO on 11/12/2017.
//  Copyright © 2017 ark-swift. All rights reserved.
//

import Foundation
import Arrow

extension Transaction: ArrowParsable {
    
    mutating public func deserialize(_ json: JSON) {
        id <-- json["id"]
        blockId <-- json["blockid"]
        type <-- json["type"]
        
        var timestamp:TimeInterval?
        timestamp <-- json["timestamp"]
        if let timestamp = timestamp {
            date = Date(timeIntervalSince1970: timestamp)
        }
        amount <-- json["amount"]
        fee <-- json["fee"]
        senderId <-- json["senderId"]
        recipientId <-- json["recipientId"]
        senderPublicKey <-- json["senderPublicKey"]
        signature <-- json["signature"]
        votes <-- json["asset.votes"]
        confirmations <-- json["confirmations"]
    }
}
