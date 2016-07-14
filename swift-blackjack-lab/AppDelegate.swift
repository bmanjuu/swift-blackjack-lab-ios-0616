//
//  AppDelegate.swift
//  swift-blackjack-lab
//
//  Created by Flatiron School on 7/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    let dealer : Dealer = Dealer.init()
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
//        Deck.init()
//        Player.init(name: "Player")
//        House.init(name: "House")
        /*
         
         * Call your custom classes here when running the scheme.
         
         */
        playBlackjack()
        
        // Do not alter
        return true  //
    }   ///////////////
    
    /*
     
     * Write your playBlackjack method in here
     
     */
    
    func playBlackjack() {
        dealer.deal()
        dealer.turn(dealer.house)
        dealer.turn(dealer.player)
        

        //check for hits
        //check for winners/busts(after hitting)/blackjack
        //awards
    }
    
}

