//
//  Delegate.swift
//  ark-swift
//
//  Created by Sacha DSO on 09/12/2017.
//  Copyright © 2017 ark-swift. All rights reserved.
//

import Foundation

public struct Delegate {
    public var username = ""
    public var address = ""
    public var publicKey = ""
    public var vote = ""
    public var producedBlocks = 0
    public var missedBlocks = 0
    public var rate = 0
    public var approval: Float = 0
    public var productivity: Float = 0
    
    public init() {}
}

