//
//  Delegate+JSON.swift
//  ark-swift
//
//  Created by Sacha DSO on 09/12/2017.
//  Copyright © 2017 ark-swift. All rights reserved.
//

import Foundation
import Arrow

extension Delegate: ArrowParsable {
    
    mutating func deserialize(_ json: JSON) {
        username <-- json["username"]
        address <-- json["address"]
        publicKey <-- json["publicKey"]
        vote <-- json["vote"]
        producedBlocks <-- json["producedblocks"]
        missedBlocks <-- json["missedblocks"]
        rate <-- json["rate"]
        approval <-- json["approval"]
        productivity <-- json["productivity"]
    }
}
