//
//  PlayingCardDeck.swift
//  PlayingCard
//
//  Created by Wiley on 2019/5/30.
//  Copyright © 2019 Wiley. All rights reserved.
//

import Foundation

struct PlayingCardDeck {
    
    var cards = [PlayingCard]()
    
    init() {
        
        for suit in PlayingCard.Suit.all {
            for rank in PlayingCard.Rank.all {
                cards += [PlayingCard(suit: suit, rank: rank)]
            }
        }
    }
    
    func drawCard() -> PlayingCard? {
        if cards.count > 0 {
            return cards[cards.count.arc4random]
        }
        return nil
    }
}

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}
