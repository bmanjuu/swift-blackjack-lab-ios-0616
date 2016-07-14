//
//  Dealer.swift
//  swift-blackjack-lab
//
//  Created by Betty Fung on 7/14/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Dealer {
    let deck : Deck
    let house : House
    let player : House
    var bet : UInt = 0
    
    func placeBet(bet: UInt) -> Bool {
//        var betPlaced : UInt = 0
        if house.wallet > bet && player.tokens > bet {
            return true
           self.bet += bet
        } else {
            return false
        }
    }
    
    func deal() {
        deck.shuffle()
        
        var dealCardsForNewRound = 0
        while dealCardsForNewRound < 2 {
            player.cards.append(deck.drawCard())
            house.cards.append(deck.drawCard())
            dealCardsForNewRound += 1
        }
        
    } //end deal function
    
    func turn(houseOrPlayer: House) {
        if houseOrPlayer.mayHit && !houseOrPlayer.blackjack {
            houseOrPlayer.cards.append(deck.drawCard())
            houseOrPlayer.stayed = false
            print("\(houseOrPlayer.name) hits!")
            
        } else {
            houseOrPlayer.stayed = true
            print("\(houseOrPlayer.name) stayed!")
        }
//            if houseOrPlayer.mustHit { //mustHit is a property that exists only in House Class
//                house.cards.append(deck.drawCard())
//            }
//            else { //house stays
//                house.stayed = true
//            }
//
    }
    
    func winner() -> String {
        var roundResult = ""
        
        let playerHandscore = player.handscore
        let houseHandscore = house.handscore
        
        if player.busted || houseHandscore > playerHandscore || houseHandscore == playerHandscore || house.blackjack {
            roundResult = "house"
        } else if house.busted || playerHandscore > houseHandscore || player.blackjack || (player.cards.count == 5 && player.busted == false) {
            roundResult = "player"
        } else {
            roundResult = "no"
        }
        
        return roundResult
    }
    
    func award() -> String {
        let roundWinner = winner()
        
        if roundWinner == "house" {
            house.wallet += bet
            player.tokens -= bet
        } else {
            player.tokens += bet
            house.wallet -= bet
        }
        
        return "\(roundWinner) is the winner! \(roundWinner) will be awarded \(bet)!"
    }
    
}
