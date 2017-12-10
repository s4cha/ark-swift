//
//  Signature+Api.swift
//  ark-swift
//
//  Created by Sacha DSO on 10/12/2017.
//  Copyright © 2017 ark-swift. All rights reserved.
//

import Foundation
import then

public extension Signature {
    
    /// Get the fee for a signature.
    static func fetchFee() -> Promise<Int> {
        return api.fetchSignatureFee()
    }
    
    /// Get the fee for a signature on a specified address.
    static func fetchFee(for address: String) -> Promise<Int> {
        return api.fetchSignatureFee(for: address)
    }
}
