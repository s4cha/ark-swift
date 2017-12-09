//
//  Api.swift
//  ark-swift-iOS
//
//  Created by Sacha DSO on 09/12/2017.
//  Copyright © 2017 ark-swift. All rights reserved.
//

import Foundation
import then

protocol Api {
    func fetchAccountBalance(for account: Account) -> Promise<Int>
    func fetchPublicKey(for account: Account) -> Promise<String>
    func fetchAccountInfo(for account: Account) -> Promise<Account>
}
