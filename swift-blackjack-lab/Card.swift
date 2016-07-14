//
//  Card.swift
//  swift-blackjack-lab
//
//  Created by Betty Fung on 7/13/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Card {
    var suit: String
    var rank: String
    var cardLabel: String
    var cardValue: UInt
    
    class func validSuit() -> [String] {
        return ["♠️", "♣️", "♦️", "♥️"]
    }
    
    class func validRank() -> [String] {
        return ["A", "2", "3", "4", "5", "6", "7", "8", "9", "J", "Q", "K"]
    }
    
    init(suit: String, rank: String){
        self.suit = suit
        self.rank = rank
        self.cardLabel = "\(suit)\(rank)"
        switch rank {
            case "A":
                self.cardValue = 1
            case "J", "Q", "K":
                self.cardValue = 10
            default:
                self.cardValue = UInt(rank)!
            }

        } // end init
        
    } //end class