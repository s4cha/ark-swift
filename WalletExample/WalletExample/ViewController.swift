//
//  ViewController.swift
//  WalletExample
//
//  Created by Sacha DSO on 10/12/2017.
//  Copyright © 2017 freshos. All rights reserved.
//

import UIKit
import Ark

class ViewController: UIViewController {

    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Account"
        let account = Account(address:"AK3wUpsmyFrWvgytFRoaHatEKj3uxUBZE6")
        addressLabel.text = account.address
        balanceLabel.text = "unkown"
        account.fetchBalance().then { [weak self] balance in
            self?.balanceLabel.text = "\(balance.confirmed.toStandard()) Ark"
        }
    }
}

extension Int {
    func toStandard() -> Int {
        return self / 100000000
    }
}
