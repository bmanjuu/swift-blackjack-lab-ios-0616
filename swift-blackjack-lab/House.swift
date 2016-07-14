//
//  House.swift
//  swift-blackjack-lab
//
//  Created by Betty Fung on 7/13/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class House : Player {

    var mustHit : Bool {return mustHitMethod()}
    
    override init(name: String) {
        super.init(name: name)
        self.tokens = 1000
    }
    
    private func mustHitMethod() -> Bool {
        if handscore < 17 {
            return true
        } else {
            return false
        }
    }
}