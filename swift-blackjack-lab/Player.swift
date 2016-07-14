//
//  Player.swift
//  swift-blackjack-lab
//
//  Created by Betty Fung on 7/13/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Player {
    var name: String
    var cards: [Card] = []
    var stayed : Bool = false
    var tokens : UInt = 100
    
    var handscore: UInt {
        var totalScore: UInt = 0
            
        for card in self.cards {
            totalScore += card.cardValue
        }
            return totalScore
    }
    
    var blackjack : Bool {
        if self.cards.count == 2 && self.handscore == 21 {
            return true
        }
        else {
            return false
        }
    }
        
    var busted : Bool {
        if self.handscore > 21 {
            return true
        } else {
            return false
        }
    }
    
    var mayHit : Bool {
        if self.busted == false {
            return false
        } else {
            return true
        }
    }
    
    // private func returns the same type that the property is expecting 
    // in property { return BLAHBLAHBLAH } 
    
//    var description : String {
//        return ""
//    }// will do it later :D
    
    init(name: String) {
        self.name = name
    }
    
    func canPlaceBet(bet: UInt) -> Bool {
        if self.tokens > bet {
            return true
        } else {
            return false
        }
    }
    
    func didWin(bet: UInt) {
        self.tokens += bet
    }
    
    func didLose(bet: UInt) {
        self.tokens -= bet
    }
}