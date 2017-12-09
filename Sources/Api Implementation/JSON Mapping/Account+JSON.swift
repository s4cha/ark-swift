//
//  Account+JSON.swift
//  ark-swift-iOS
//
//  Created by Sacha DSO on 09/12/2017.
//  Copyright © 2017 ark-swift. All rights reserved.
//

import Foundation
import Arrow

extension Account: ArrowParsable {
    
    mutating func deserialize(_ json: JSON) {
        print(json)
        guard let account = json["account"] else {
            return
        }
        address <-- account["address"]
        balance <-- account["balance"]
        publicKey <-- account["publicKey"]
        secondPublicKey <-- account["secondPublicKey"]
    }
}
