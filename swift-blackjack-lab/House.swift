//
//  House.swift
//  swift-blackjack-lab
//
//  Created by Betty Fung on 7/13/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class House : Player {
    
    var wallet : UInt
    var mustHit : Bool {return mustHitMethod()}
    
    override init(name: String) {
        self.wallet = 1000
        super.init(name: name)
    }
    
    private func mustHitMethod() -> Bool {
        if self.handscore >= 17 {
            return false
        } else {
            return true
        }
    }
    
}