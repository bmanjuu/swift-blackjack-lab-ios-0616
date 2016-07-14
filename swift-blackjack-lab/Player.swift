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
        let currentCard: Card
        var score: UInt = 0
        var runningTotal: UInt = 0
        
        if currentCard.rank == "A" {
            aceInHand = true
            score = checkAce(currentCard)
        } else {
            score = currentCard.cardValue
        }
        runningTotal += score
        
        return runningTotal
    }
    
    
    func checkAce(card: Card) -> UInt {
        var aceValue: UInt = 1
        if self.handscore <= 11 {
            aceValue = 10
        }
        return aceValue
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
    
    func playerDescription() -> String {
        return "Player: \(name) \nCards: \(cards) \nTokens:\(tokens) \nScore: \(handscore)"
    }
    
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