//
//  Balance+JSON.swift
//  ark-swift-iOS
//
//  Created by Sacha DSO on 09/12/2017.
//  Copyright © 2017 ark-swift. All rights reserved.
//


import Foundation
import Arrow

extension Balance: ArrowParsable {
    
    mutating func deserialize(_ json: JSON) {
        confirmed <-- json["balance"]
        unconfirmed <-- json["unconfirmedBalance"]
    }
}
