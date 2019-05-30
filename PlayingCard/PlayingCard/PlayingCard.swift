//
//  PlayingCard.swift
//  PlayingCard
//
//  Created by Wiley on 2019/5/30.
//  Copyright © 2019 Wiley. All rights reserved.
//

import Foundation

struct PlayingCard: CustomStringConvertible {
    
    var description: String { return "\(suit)\(rank)" }
    
    var suit: Suit
    var rank: Rank

    enum Suit: String, CustomStringConvertible {
        
        var description: String { return "\(self.rawValue)" }
        
        case spades = "♠️"
        case hearts = "❤️"
        case clubs = "♣️"
        case diamonds = "♦️"
        
        static var all = [Suit.spades, .hearts, .clubs, .diamonds]
    }
    
    enum Rank: CustomStringConvertible {
        
        var description: String {
            switch self {
            case .ace: return "A"
            case .num(let pipsCount): return String(pipsCount)
            case .face(let kind): return kind
            }
        }
        
        
        case ace
        case num(Int)
        case face(String)
        
        var order: Int {
            switch self {
            case .ace: return 1
            case .num(let pipsCount): return pipsCount
            case .face(let kind) where kind == "J": return 11
            case .face(let kind) where kind == "Q": return 12
            case .face(let kind) where kind == "K": return 13
            default: return 0
            }
        }
        
        static var all: [Rank] {
            var allRank = [Rank.ace]
            for pips in 1...10 {
                allRank += [Rank.num(pips)]
            }
            allRank += [Rank.face("J"), Rank.face("Q"), Rank.face("K")]
            return allRank
        }
    }
}
