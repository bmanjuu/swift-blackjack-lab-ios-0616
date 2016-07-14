//
//  Deck.swift
//  swift-blackjack-lab
//
//  Created by Betty Fung on 7/13/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Deck {
    private var dealtCards : [Card]
    private var undealtCards : [Card]
    var description : String { return descriptionFunction() }
    
    init() {
        self.dealtCards = []
        self.undealtCards = []
        
        for suit in Card.validSuit() {
            for rank in Card.validRank() {
                undealtCards.append(Card.init(suit: suit, rank: rank))
            }
        } // end of for loops
    }// end of init
    
    
    func drawCard() -> Card {
        let nextCard = undealtCards[0]
        undealtCards.removeAtIndex(0)
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
    
    func descriptionFunction() -> String {
        return "Dealt cards for this round are:\n \(self.dealtCards) \n\n Remaining cards in the deck:\n \(self.undealtCards)" 
    }
    
}// end of classDeck