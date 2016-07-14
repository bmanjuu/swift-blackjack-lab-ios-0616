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
    var description : String {return playerDescription() }
    var aceInHand : Bool = false
    
    var handscore: UInt {return calculateScore()}
    
    func calculateScore() -> UInt {
        var score: UInt = 0
        
        for card in self.cards {
            score += card.cardValue
            
            if card.cardLabel.containsString("A") {
                aceInHand = true
            }
        }
        if aceInHand && score <= 11 {
            score += 10
        }
        
        return score
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
        if !busted && !blackjack && !stayed && handscore <= 16 {
            return true
        } else {
            return false
        }
    }
    
    // private func returns the same type that the property is expecting 
    // in property { return BLAHBLAHBLAH } 
    
    func playerDescription() -> String {
        return "Player: \(name)\nCards: \(cards)\nTokens:\(tokens)\nCurrent Score: \(handscore)\nStayed: \(stayed)\nBlackjack: \(blackjack)\nBusted: \(busted)"
    }
    
    init(name: String) {
        self.name = name
    }
    
    func canPlaceBet(bet: UInt) -> Bool {
        if self.tokens >= bet {
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