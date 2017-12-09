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
        address <-- json["address"]
        balance = Balance()
        balance?.confirmed <-- json["balance"]
        balance?.unconfirmed <-- json["unconfirmedBalance"]
        publicKey <-- json["publicKey"]
        secondPublicKey <-- json["secondPublicKey"]
        unconfirmedSignature <-- json["unconfirmedSignature"]
        secondSignature <-- json["secondSignature"]
    }
}


