//
//  Deck.swift
//  swift-blackjack-lab
//
//  Created by Betty Fung on 7/13/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Deck {
    private var dealtCards : [Card] = []
    private var undealtCards : [Card] = []
    var description : String { return descriptionFunction() }
    
    init() {
        for suit in Card.validSuits() {
            for rank in Card.validRanks() {
                let card = Card.init(suit: suit, rank: rank)
                self.undealtCards.append(card)
            }
        } // end of for loops
    }// end of init
    
    func descriptionFunction() -> String {
        return "Cards dealt: \(self.dealtCards.count), Cards remaining: \(self.undealtCards.count)"
    }
    
    func drawCard() -> Card {
        let nextCard = undealtCards[(undealtCards.count)-1]
        undealtCards.removeLast()
        dealtCards.append(nextCard)
        return nextCard
    }
    
    func shuffle() {
        undealtCards.appendContentsOf(dealtCards)
        dealtCards.removeAll()
        
        let randomInteger = arc4random_uniform(UInt32(undealtCards.count))
        let randomCard = undealtCards[Int(randomInteger)]
        undealtCards.append(randomCard)
    }

    
}// end of classDeck