//
//  Deck.swift
//  swift-blackjack-lab
//
//  Created by Betty Fung on 7/13/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Deck {
    var dealtCards : [Card]
    var undealtCards : [Card]
    var description : String {
        
        var cardDescription = ""
        
        func cardsInGame() {
            
            
        }
        
        return cardDescription
        
    }
    
    init() {
        self.dealtCards = []
        self.undealtCards = []
        
        for suit in Card.validSuit() {
            for rank in Card.validRank() {
                undealtCards.append(Card.init(suit: suit, rank: rank))
            }
        } // end of for loops
    }// end of init
    
    
    func drawCard() {
        let nextCard = undealtCards[0]
        undealtCards.removeAtIndex(0)
        dealtCards.append(nextCard)
    }
    
    func shuffle() {
        undealtCards.appendContentsOf(dealtCards)
        dealtCards.removeAll()
        
        let randomInteger = arc4random_uniform(UInt32(undealtCards.count))
        let randomCard = undealtCards[Int(randomInteger)]
        undealtCards.append(randomCard)
    }
    
}// end of classDeck