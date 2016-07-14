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
    
    init(){
        self.deck = Deck.init()
        self.house = House.init(name: "House")
        self.player = House.init(name: "Player")
    }
    
    func placeBet(bet: UInt) -> Bool {
//        var betPlaced : UInt = 0
        if house.tokens > bet && player.tokens > bet {
            self.bet += bet
            return true
        } else {
            return false
        }
    }
    
    func deal() {
        house.stayed = false
        player.stayed = false
        house.cards.removeAll()
        player.cards.removeAll()
        
        deck.shuffle()
        
        player.cards.append(deck.drawCard())
        house.cards.append(deck.drawCard())
        player.cards.append(deck.drawCard())
        house.cards.append(deck.drawCard())
        
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
        } else if house.busted || playerHandscore > houseHandscore || player.blackjack || (player.cards.count == 5 && !player.busted) {
            roundResult = "player"
        } else {
            roundResult = "no"
        }
        
        return roundResult
    }
    
    func award() -> String {
        let roundWinner = winner()
        
        if roundWinner == "house" {
            house.tokens += bet
            player.tokens -= bet
            return "\(roundWinner) wins!"
        } else if roundWinner == "player" {
            player.tokens += bet
            house.tokens -= bet
            return "\(roundWinner) wins!"
        } else {
            return "Game is still in process"
        }
        
    }
    
}
