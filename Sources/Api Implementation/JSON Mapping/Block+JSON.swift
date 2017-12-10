//
//  Block+JSON.swift
//  ark-swift
//
//  Created by Sacha DSO on 10/12/2017.
//  Copyright © 2017 ark-swift. All rights reserved.
//

import Foundation
import Arrow

extension Block: ArrowParsable {
    
    mutating public func deserialize(_ json: JSON) {
        id <-- json["id"]
        version <-- json["version"]
        timestamp <-- json["timestamp"]
        height <-- json["height"]
        previousBlock <-- json["previousBlock"]
        numberOfTransactions <-- json["numberOfTransactions"]
        totalAmount <-- json["totalAmount"]
        totalFee <-- json["totalFee"]
        reward <-- json["reward"]
        payloadLength <-- json["payloadLength"]
        payloadHash <-- json["payloadHash"]
        generatorPublicKey <-- json["generatorPublicKey"]
        generatorId <-- json["generatorId"]
        blockSignature <-- json["blockSignature"]
        confirmations <-- json["confirmations"]
        totalForged <-- json["totalForged"]
    }
}
